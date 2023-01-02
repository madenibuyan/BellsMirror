
import 'dart:async';

import 'package:bells_mirror/Services/news_service/news_service.dart';
import 'package:bells_mirror/datamodel/news_model.dart';
import 'package:bells_mirror/utils/locator.dart';
import 'package:get/get.dart';

class HomeWidgetController extends GetxController{





  NewsService _newsService = locator<NewsService>();


  StreamSubscription<List<NewsModel>> _subscription;

  List<NewsModel> newsList = [];


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
      newsList =   event ?? [];
      update();

    });

  }


}