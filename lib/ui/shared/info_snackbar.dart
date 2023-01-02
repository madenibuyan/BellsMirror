
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void showInfoSnackBar({String message}){

 if(Get.isSnackbarOpen) return;

 Get.rawSnackbar(messageText: Text(message, style: GoogleFonts.roboto(
     color: Colors.white,
     fontSize: 14)));
}