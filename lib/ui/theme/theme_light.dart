import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeggiaLightTheme {
  static const Color Blue = Color(0xff6678ff);
  static const Color greyBackgroundColor = Color(0xffEFEFEF);
  static const Color primaryColorLight = Color(0xff34C47C);
  static const Color errorColor = Color(0xffFF2650);
  static const Color textColorDark = Color(0xff1A1824);
  static const Color textColorLight = Color(0xff919099);
  static const Color accentColor = Color(0xffEBA41D);
  static const backgroundColor = Colors.white;

  static ThemeData appLightTheme() {
    return ThemeData.light().copyWith(

      primaryTextTheme: TextTheme(
        bodyText1: TextStyle(
          color: primaryColorLight
        )
      ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: greyBackgroundColor,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColorLight,
        ),
        dividerTheme: DividerThemeData(),
        dialogTheme:
            DialogTheme(contentTextStyle: TextStyle(color: textColorDark)),

        primaryColor: primaryColorLight,
        scaffoldBackgroundColor: backgroundColor,
        errorColor: errorColor,
        backgroundColor: greyBackgroundColor,
        accentColor: accentColor,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.poppins(color: textColorDark),
          bodyText2: GoogleFonts.poppins(color: textColorDark),
          headline5: TextStyle(color: textColorDark),
          headline6: TextStyle(
              color: textColorDark, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        primaryColorLight: textColorLight,
        primaryColorDark: textColorDark,
        tabBarTheme: TabBarTheme(
          labelStyle: TextStyle(
            color: textColorDark
          )
        ),
        iconTheme: IconThemeData(color: Colors.black),
        appBarTheme: AppBarTheme(
          elevation: 0,
          brightness: Brightness.light,
          color: Colors.white,
          textTheme: TextTheme(
            headline1: TextStyle(color: textColorDark),
            headline2: TextStyle(color: textColorDark),
            headline3: TextStyle(color: textColorDark),
            headline4: TextStyle(color: textColorDark),
            headline5: TextStyle(color: textColorDark),
            headline6: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
        ));
  }
}
