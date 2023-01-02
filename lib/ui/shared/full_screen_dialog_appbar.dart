import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget fullScreenDialogAppBar({String title, Function function}) {
  return AppBar(
    leading: IconButton(
      icon: Icon(
          Icons.arrow_back,
        key: Key(title),
      ),
      onPressed: () {
        if (function.isNull) {
          Get.back();
        } else {
          function.call();
        }
      },
    ),
    centerTitle: true,
    title: Text(
      title,
      style:
          TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
    ),
  );
}
