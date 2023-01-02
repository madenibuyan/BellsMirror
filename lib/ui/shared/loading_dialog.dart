

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bells_mirror/ui/shared/load_screen.dart';
import 'loading_anim.dart';

Future<void> loadDialog({String title, bool dismiss}){



  Get.to(LoadingScreen(title: title,),
      opaque: false,
      fullscreenDialog: true,
      transition: Transition.fadeIn
  );
}