import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:starflare/core/constants/string_constants.dart';

class SharedPrefController extends GetxController {
  final sharedPref = GetStorage(StringConstants.spStorageName);

  // observables
  final isDark = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    // initate darkmode sharedpref if not initiated
    sharedPref.writeIfNull(StringConstants.spDataDarkModeName, false);

    isDark.value = sharedPref.read(StringConstants.spDataDarkModeName) ?? false;
  }

  bool get getIsDark => isDark.value;

  ThemeMode get getTheme => isDark.value ? ThemeMode.dark : ThemeMode.light;

  void changeTheme(bool val) {
    sharedPref.write(
      StringConstants.spDataDarkModeName,
      val,
    );

    isDark.value = sharedPref.read(StringConstants.spDataDarkModeName) ?? false;
  }
}
