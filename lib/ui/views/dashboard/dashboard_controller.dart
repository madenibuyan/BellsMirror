import 'package:get/get.dart';

import '../home_screen_controller.dart';

class DashboardController extends GetxController {
  void closeDrawer(HomeMenu menu) {
    try {
      var controller = Get.find<HomeScreenController>();

      controller.closeDrawer(menu);
    } catch (e) {}
  }


  String getStudentName(){


    try{
     var data = Get.find<HomeScreenController>().studentData;

     if(data == null ){
       return "Null";
     }

     return data.name;
    } catch(e){

      return "Null";
    }

  }

}
