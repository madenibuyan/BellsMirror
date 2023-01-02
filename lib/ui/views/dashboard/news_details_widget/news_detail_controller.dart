import 'dart:async';

import 'package:bells_mirror/Services/bookmark_service/bookmark_service.dart';
import 'package:bells_mirror/Services/news_service/news_service.dart';
import 'package:bells_mirror/datamodel/news_model.dart';
import 'package:bells_mirror/ui/shared/info_snackbar.dart';
import 'package:bells_mirror/utils/locator.dart';
import 'package:bells_mirror/utils/test_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewsDetailController extends GetxController {


  NewsService _newsService = locator<NewsService>();


  BookmarkService _bookmarkService = locator<BookmarkService>();

  StreamSubscription<List<NewsModel>> _subscription;

  List<NewsModel> newsList = [];

  List<NewsModel> searchList = [];

  NewsModel newsModel;

  NewsDetailController({this.newsModel});


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




  void addBookmark() async {

    showInfoSnackBar(
        message: "Added to Bookmark");

   await _bookmarkService.addNews(news: newsModel);

  }
}
