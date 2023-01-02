import 'package:bells_mirror/Services/auth_service/auth_service.dart';
import 'package:bells_mirror/ui/route/route_names.dart';
import 'package:bells_mirror/ui/views/home_screen_controller.dart';
import 'package:bells_mirror/utils/locator.dart';
import 'package:get/get.dart';

class MenuWidgetController extends GetxController {
  AuthService _authService = locator<AuthService>();

  void logoutClicked() async {
    try {
      await _authService.signOut();
    } catch (e) {}

    Get.offNamedUntil(RouteName.login, (route) => false);

    return;
  }
}
