
import 'package:bells_mirror/Services/bookmark_service/bookmark_service.dart';
import 'package:bells_mirror/Services/image_service/image_service.dart';
import 'package:bells_mirror/Services/news_service/news_service.dart';
import 'package:bells_mirror/Services/upload_image_service/upload_image_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:bells_mirror/Services/auth_service/auth_service.dart';
import 'package:bells_mirror/Services/cloud_function/cloud_function_service.dart';
import 'package:bells_mirror/Services/notification_service/notification_service.dart';


import 'package:bells_mirror/Services/student_data_service/student_data_service.dart';

var locator = GetIt.instance;



void setupServices() {
  locator.registerLazySingleton<AuthService>(() => AuthServiceReal());
  locator.registerFactory<CloudFunctionService>(() => CloudFunctionServiceReal());
  locator.registerFactory<NotificationService>(() => NotificationServiceReal());

  locator.registerFactory<NewsService>(() => NewsServiceReal());

  locator.registerFactory<BookmarkService>(() => BookmarkServiceReal());

  locator.registerFactory<PickImageService>(() => PickImageServiceReal());

  locator.registerFactory<UploadImageService>(() => UploadImageServiceReal());




  locator.registerFactory<StudentDataService>(() => StudentDataServiceReal());


}

void showNotification({String title, String message}) async {





  return;
}

void initializeNotifications() {


}

Future<void> initializeLocalNotifications() async {


}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
}

void setupScreenUtil(BuildContext context) {


  if (Get.width > 375) {
    ScreenUtil.init(context,
        designSize: Size(Get.width, Get.height), allowFontScaling: true);
  } else {
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
  }
}
