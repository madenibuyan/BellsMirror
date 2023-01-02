import 'dart:async';

import 'package:bells_mirror/Services/bookmark_service/bookmark_service.dart';
import 'package:bells_mirror/Services/news_service/news_service.dart';
import 'package:bells_mirror/datamodel/news_model.dart';
import 'package:bells_mirror/ui/shared/info_snackbar.dart';
import 'package:bells_mirror/utils/locator.dart';
import 'package:bells_mirror/utils/test_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BookmarkNewsWidgetController extends GetxController {
  TextEditingController editingController = TextEditingController();


  BookmarkService _newsService = locator<BookmarkService>();

  StreamSubscription<List<NewsModel>> _subscription;

  List<NewsModel> newsList = [];

  List<NewsModel> searchList = [];



  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    fetchNewsData();
    super.onInit();
  }

  void fetchNewsData() {
    _subscription = _newsService.listenForNewsService().listen((event) {
      newsList = event ?? [];
      searchList = event ?? [];
      update();
    });
  }

  void filterSearch(String value) {
    if (value.isEmpty) {
      newsList = searchList;
      update();
      return;
    }

    newsList = searchList
        .where((element) =>
        element.topic.toLowerCase().contains(value.toLowerCase()))
        .toList();

    update();
  }

  void removeBookmark(int index) async {

    String documentId =  newsList[index].documentId;
    String path = newsList[index].path;

    newsList.removeAt(index);
    update();


    await Future.delayed(Duration(milliseconds: 250));

    showInfoSnackBar(message: "News removed from book mark");

    _newsService.deleteNews(documentId: documentId, path: path);

  }
}
