import 'dart:async';

import 'package:bells_mirror/Services/image_service/image_service.dart';
import 'package:bells_mirror/Services/news_service/news_service.dart';
import 'package:bells_mirror/Services/upload_image_service/upload_image_service.dart';
import 'package:bells_mirror/datamodel/news_model.dart';
import 'package:bells_mirror/ui/shared/info_snackbar.dart';
import 'package:bells_mirror/ui/shared/loading_dialog.dart';
import 'package:bells_mirror/utils/locator.dart';
import 'package:bells_mirror/utils/test_data.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class AdminNewsWidgetController extends GetxController {
  TextEditingController editingController = TextEditingController();


  PickImageService _pickImageService = locator<PickImageService>();
  UploadImageService _uploadImageService = locator<UploadImageService>();


  NewsService _newsService = locator<NewsService>();


  StreamSubscription<List<NewsModel>> _subscription;

  List<NewsModel> newsList = [];


  @override
  void onInit() {

    fetchNewsData();
    super.onInit();
  }

  void filterSearch(String value) {
    if (value.isEmpty) {
      newsList = TestData.fakeNews();
      update();
      return;
    }

    newsList = TestData.fakeNews()
        .where((element) =>
            element.topic.toLowerCase().contains(value.toLowerCase()))
        .toList();

    update();
  }

  void deleteNews({int index}) async {

    String documentId =  newsList[index].documentId;
    String path = newsList[index].path;

    newsList.removeAt(index);
    update();


    await Future.delayed(Duration(milliseconds: 250));

    showInfoSnackBar(message: "News delete");

     _newsService.deleteNews(documentId: documentId, path: path);


  }

  void fetchNewsData() {


    _subscription = _newsService.listenForNewsService().listen((event) {


      newsList = event ?? [];

      update();

    });

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

    // if (courier == null || courier.uid == null) {
    //   showInfoSnackBar(message: "Courier UID is null");
    //   return;
    // }

    Asset asset = await _pickImageService.selectImage();

    if (asset == null) {
      showInfoSnackBar(message: "No image selected");
      return;
    }

    loadDialog(title: "Uploading image", dismiss: false);

    String path = "courier/${""}/profile/image.jpg";

    String downloadUrl =
    await _uploadImageService.uploadImage(asset: asset, reference: path);

    Get.back();
    if (downloadUrl == null) {
      showInfoSnackBar(message: "Error uploading image");
      return;
    }

    print("url is $downloadUrl");

   // courier.image = downloadUrl;
    update();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}
