

import 'package:bells_mirror/utils/constant_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {


  Future<bool> isLightMode();
  Future<bool> toggleLightMode();

  Future<bool> firstTime();
  Future<bool> setFirstTime();
}



class StorageServiceFake extends StorageService {



  @override
  Future<bool> isLightMode() async {

    return false;
  }

  @override
  Future<bool> toggleLightMode() async {
    return true;
  }

  @override
  Future<bool> firstTime() async {

    return true;
  }

  @override
  Future<bool> setFirstTime() async {

    return false;
  }
}


class StorageServiceReal extends StorageService {
  Future<SharedPreferences> getSharedPreference() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool> isLightMode() async {
    var preference = await getSharedPreference();
    return preference.getBool(Constant.darkMode) ?? false;
  }

  @override
  Future<bool> toggleLightMode() async {

    var preferences = await getSharedPreference();
    bool light = !(preferences.getBool(Constant.darkMode) ?? false);
    await preferences.setBool(Constant.darkMode, light);

    return light;

  }

  @override
  Future<bool> firstTime() async {
    var preference = await getSharedPreference();
    return preference.getBool(Constant.firstTimeUser) ?? true;
  }

  @override
  Future<bool> setFirstTime() async {
    var preference = await getSharedPreference();
    return await preference.setBool(Constant.firstTimeUser, false);
  }
}
