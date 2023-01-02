import 'package:bells_mirror/Services/image_service/image_service.dart';
import 'package:bells_mirror/Services/news_service/news_service.dart';
import 'package:bells_mirror/Services/upload_image_service/upload_image_service.dart';
import 'package:bells_mirror/datamodel/deggia_image_class.dart';
import 'package:bells_mirror/datamodel/news_model.dart';
import 'package:bells_mirror/ui/shared/info_snackbar.dart';
import 'package:bells_mirror/ui/shared/loading_dialog.dart';
import 'package:bells_mirror/utils/locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class AddNewsScreenController extends GetxController {
  PickImageService _pickImageService = locator<PickImageService>();
  UploadImageService _uploadImageService = locator<UploadImageService>();

  NewsModel newsModel;

  NewsService _newsService = locator<NewsService>();

  TextEditingController topicController = TextEditingController();
  TextEditingController bodyController = TextEditingController();


  AddNewsScreenController({this.newsModel});

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() {
    if (newsModel == null) return;



    topicController.text = newsModel.topic;
    bodyController.text = newsModel.body;

    update();
  }

  bool imageAvailable() {
    return newsModel != null && newsModel.image != null;
  }

  Future<bool> connected() async {
    var connection = await Connectivity().checkConnectivity();

    return connection != ConnectivityResult.none;
  }

  void changeImage() async {
    bool connection = await connected();

    if (!connection) {
      showInfoSnackBar(message: "No network connection");
      return;
    }

    if (newsModel == null || newsModel.documentId == null) {
      showInfoSnackBar(message: "News  is null");
      return;
    }

    Asset asset = await _pickImageService.selectImage();

    if (asset == null) {
      showInfoSnackBar(message: "No image selected");
      return;
    }

    loadDialog(title: "Uploading image", dismiss: false);

    String path = "news/${newsModel.documentId}/image.jpg";

    DeggiaImageClass downloadUrl = await _uploadImageService
        .uploadImageCollection(asset: asset, reference: path);

    Get.back();
    if (downloadUrl == null) {
      showInfoSnackBar(message: "Error uploading image");
      return;
    }

    print("url is $downloadUrl");

    newsModel.image = downloadUrl.url;
    newsModel.path = downloadUrl.ref;
    update();
  }

  void addNewsClicked() async {
    String topic = topicController.text.trim();
    String des = bodyController.text.trim();

    if (topic.isEmpty || des.isEmpty) {
      showInfoSnackBar(message: "Fields cannot be empty");
      return;
    }

    if (topic.length < 3 || des.length < 3) {
      showInfoSnackBar(message: "Must be greater than 3 character");
      return;
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    if (newsModel == null || newsModel.documentId==null) {
      String id = firestore.collection("admin").doc().id;

      newsModel = NewsModel(

          image: "https://images.pexels.com/photos/5212348/pexels-photo-5212348.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
          path: "",
          author: "Admin",
          date:  new DateTime.now().millisecondsSinceEpoch,
          documentId: id, topic: topic, body: des);
    }

    Get.back();

    _newsService.addNews(news: newsModel);

    showInfoSnackBar(message: "News Added");
  }
}
