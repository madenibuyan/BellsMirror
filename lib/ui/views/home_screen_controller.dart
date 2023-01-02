import 'dart:async';

import 'package:get/get.dart';
import 'package:bells_mirror/Services/auth_service/auth_service.dart';
import 'package:bells_mirror/Services/student_data_service/student_data_service.dart';
import 'package:bells_mirror/datamodel/student_data.dart';
import 'package:bells_mirror/ui/route/route_names.dart';
import 'package:bells_mirror/utils/locator.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'authentication/default_auth/default_auth_screen.dart';
import 'authentication/login/login_screen.dart';

class HomeScreenController extends GetxController {

  PersistentTabController controller = PersistentTabController(initialIndex: 0);



  HomeMenu selectedItem = HomeMenu.dashboard;

  bool isDarkMode = false;

  AuthService _authService = locator<AuthService>();
  StudentDataService _studentDataService = locator<StudentDataService>();

  bool isAssistant = false;

  StreamSubscription<bool> _authSubscription;


  bool showFloating = false;
  StreamSubscription<StudentData> _studentDataStreamSub;
  StudentData studentData =
      StudentData(name: "Null", email: "Null", matric: "Null");

  void closeDrawer(HomeMenu option) async {
    Get.back();

    await Future.delayed(Duration(milliseconds: 500));

    if (option == HomeMenu.signOut) {
      try {
        await _authService.signOut();
      } catch (e) {}

      Get.offNamedUntil(RouteName.login, (route) => false);

      return;
    }

    selectedItem = option;

    update();
  }

  @override
  void onInit() {
    super.onInit();
    listenForAuthChanges();
    fetchStudentData();
   // checkIfAdmin();
  }

  void fetchStudentData() {



    try{
      _studentDataStreamSub =
          _studentDataService.listenForStudentData().listen((event) {
            studentData =
                event ?? StudentData(name: "Null", email: "Null", matric: "Null");

            update();
          });
    } catch(e){
      print(e);
    }

  }

  void listenForAuthChanges() {
    _authSubscription = _authService.changeUser().listen((event) {
      if (!event) {
        Get.offAll(LoginScreen());
      }

      checkIfAdmin();

      update();
    });
  }

  void checkIfAdmin () async {

   var admin = await _authService.isAdmin();


   print("");

   if(admin){
     Get.offAll(LoginScreen());
   }

  }

  @override
  Future<void> onClose() async {
    await _authSubscription?.cancel();

    await _studentDataStreamSub?.cancel();

    return super.onClose();
  }

  String getDeggiaPopMenuTitle({DeggiaPopMenu value}) {
    String title = "";

    switch (value) {
      case DeggiaPopMenu.theme:
        title = "Theme";
        break;
      case DeggiaPopMenu.topic:
        title = "Enable Notifications";
        break;
      case DeggiaPopMenu.notification:
        title = "Send Notifications";
        break;
    }

    return title;
  }

  void changeFloating({bool value}) {
    showFloating = value;
    update();
  }


}

enum DeggiaPopMenu {
  theme,
  topic,
  notification,
}

enum HomeMenu {
  dashboard,
  appointment,
  pill_reminder,
  notifications,
  appointment_history,
  signOut
}
