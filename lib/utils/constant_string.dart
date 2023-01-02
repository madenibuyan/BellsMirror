import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

class Constant {


  static const String openTime = "openTime";
  static const String closeTime = "closeTime";

  static const int openTimeDefault = 9;
  static const int closeTimeDefault = 20;
  static const String maintenance = "maintenance";
  static const bool maintenanceDefault = false;


  static const String nairaSymbol = "\u{20A6}";

  static const String notificationImage =
      "assets/images/notification_image.png";

  static const String onboarding_fast_delivery =
      "assets/images/onboarding_fast_delivery.png";
  static const String loaderIcon = "assets/images/icon_loader_green.png";
  static const String messageErrorImage =
      "assets/images/message_error_state.png";



  static const String onBoardingOne =
      "assets/images/onboarding_image_one.png";

  static const String onBoardingTwo =
      "assets/images/onboarding_image_two.png";

  static const String onBoardingThree =
      "assets/images/onboarding_image_three.png";

  static const String profileAvatar =
      "assets/images/profile_avatar.png";


  static const String newsIcon =
      "assets/images/news_icon.png";


  static const String celebration_image =
      "assets/images/celebrate.png";

  static const String defaultCourierAvatar =
      "https://firebasestorage.googleapis.com/v0/b/deggia.appspot.com/o/courier_avatar%2FImagefast_delivery.png?alt=media&token=437fc787-9426-4c30-ad17-eb2ca29cc822";


  static const String placeHolderImage =
      "assets/images/placeholder_image.png";
  static const String orderTransactionConfirmed =
      "assets/images/order_transaction_confirmed.png";
  static const String orderSuccess = "assets/images/order_success.png";

  static const String checkedIcon = "assets/images/icon_big_check.png";

  static const String leaderBoard = "assets/images/leader_board.png";

  static const String leaderBoardTwo = "assets/images/leader_board_two.png";

  static const String stethoscopeImage = "assets/images/stethoscope.png";

  static const String pillsImage = "assets/images/pills_image.png";


  static const String lectureFree = "assets/images/lecture_free_week.png";

  static const String timeIcon = "assets/images/time_icon.png";

  static const String notifIcon = "assets/images/notif_icon.png";


  ///////////

  static const String facebookIcon = "assets/images/facebook_icon.png";

  static const String gmailIcon = "assets/images/gmail_icon.png";


  static const String whatsappIcon = "assets/images/whatsapp_icon.png";


  static const String linkIcon = "assets/images/link_icon.png";


  static const String shareNews = "assets/images/share_news_icon.png";

  //////////


  static const String emptyPill = "assets/images/empty_pill.png";

  static const String alarmClock = "assets/images/alarm_clock.png";

  static const String lightIcon = "assets/images/light_icon.png";

  static const String pauseIcon = "assets/images/pause_icon.png";


  static const String checkMailImage = "assets/images/check_mail.png";
  static const String deggia_card = "assets/images/deggia_card.png";

  static const String transfer_success_dark = "assets/images/transfer_success_dark.png";
  static const String transfer_success_white = "assets/images/transfer_success_white.png";

  static const String minTopup = "minTopup";
  static const String maxTopup = "maxTopup";

  static const String minWithDraw = "minWithDraw";
  static const String maxWithDraw = "maxWithDraw";
  static const String withDrawFee = "withDrawFee";

  static const String maxTransfer = "maxTransfer";
  static const String maxBalance = "maxBalance";
  static const String minTransfer = "minTransfer";
  static const String transferFee = "transferFee";
  static const String offSunday = "offSunday";
  static const String allowExtraMinutes = "allowExtraMinutes";

  ///////////////////



  static const bool defaultOffSunday = false;
  static const bool defaultAllowExtraMinutes = false;
  static const double minTopupDefault = 100;
  static const double maxTopupDefault = 3000;

  static const double minWithDrawDefault = 100;
  static const double maxWithDrawDefault = 50000;


  static const double maxTransferDefault = 5000;
  static const double maxBalanceDefault = 15000;
  static const double minTransferDefault = 50;
  static const double transferFeeDefault = 3;


  static const double rewardMinDefault = 4000;
  static const String rewardMin = "rewardMin";

  static const String verifyPhone = "verifyPhone";
  static const bool verifyPhoneDefault = false;



  ////





  static const String logoImage = "assets/images/logo.png";


  static const String loginSuccess = "success";

  static const String darkMode = "darkMode";

  static const String firstTimeUser = "firstTimeUser";

  static const bool release = true;


  static String moneyFormat(double amount) {
    return NumberFormat.simpleCurrency(
            name: "${Constant.nairaSymbol}", decimalDigits: 1)
        .format(amount);
  }

  static List<Color> multiColors = [
    Colors.red,
    Colors.amber,
    Color(0xff34C47C),
    Colors.cyan,
    Colors.deepPurple,
    Colors.purpleAccent,
    Colors.blue,
  ];

   static final animOptions = LiveOptions(
    // Start animation after (default zero)
    delay: Duration(seconds: 0),
    showItemInterval: Duration(milliseconds: 0),
    // Animation duration (default 250)
    showItemDuration: Duration(seconds: 1),

    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );

   static double getTransferCharges({double amount}){

    double charges = 0;
    if(amount <=5000){
      charges = 11;
    }
    else if( amount > 5000){
      charges = 27;
    }
    else if(amount > 10000){
      charges  = 54;
    }
    return charges;
   }


   static List<String> getUssBanks(){

     return <String>[
       "044",
       "050",
       "070",
       "011",
       "214",
       "058",
       "030",
       "082",
       "221",
       "232",
       "033",
       "032",
       "035",
       "057",

     ];
   }




}
