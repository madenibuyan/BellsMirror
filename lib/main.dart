import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'ui/route/route_names.dart';
import 'ui/theme/theme_light.dart';
import 'utils/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  setupServices();

  await Firebase.initializeApp();



  // FirebaseFunctions.instance
  //     .useFunctionsEmulator(origin: "http://10.0.2.2:5001");
  //
  //
  // String host = defaultTargetPlatform == TargetPlatform.android
  //     ? '10.0.2.2:8080'
  //     : 'localhost:8080';

  //
  // FirebaseFirestore.instance.settings =
  //     Settings(host: host, sslEnabled: false);

  initializeNotifications();


  await initializeLocalNotifications();

  runApp(
    MedicareApp(),
  );
}

class MedicareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splash_screen,

      getPages: RouteName.getPages(),
      theme: DeggiaLightTheme.appLightTheme(),
      //onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}
