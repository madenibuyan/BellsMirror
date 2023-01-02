import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeggiaDarkTheme {
  static const Color Blue = Color(0xff6678ff);
  static const Color greyBackgroundColor = Color(0xff707070);


  static const Color primaryColor = Color(0xff34C47C);
  static const Color errorColor = Color(0xffFF2650);
  static const Color textColorDark = Color(0xffFFFFFF);
  static const Color textColorLight = Color(0xff919099);
  static const Color accentColor = Color(0xffEBA41D);
  static const backgroundColor =  Color(0xff1A1824); // Colors.black;

  static ThemeData appDarkTheme() {
    return ThemeData.dark().copyWith(
      bottomSheetTheme: BottomSheetThemeData(

      ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
        ),
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        backgroundColor: greyBackgroundColor,
        accentColor: accentColor,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.poppins(color: textColorDark),
          bodyText2: GoogleFonts.poppins(color: textColorDark),
        ),

        iconTheme: IconThemeData(
            color: Colors.white
        ),

        primaryColorLight: textColorLight,
        primaryColorDark: textColorDark,

        appBarTheme: AppBarTheme(
          elevation: 0,
          brightness: Brightness.dark,
          color: backgroundColor,
          textTheme: TextTheme(
            headline1: TextStyle(color: textColorDark),
            headline6: TextStyle(
                color: textColorDark,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          iconTheme: IconThemeData(color: textColorDark),
          actionsIconTheme: IconThemeData(color: textColorDark),
        ));
  }
}
