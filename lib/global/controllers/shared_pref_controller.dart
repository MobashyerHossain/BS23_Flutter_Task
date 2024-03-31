import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:starflare/core/constants/string_constants.dart';
import 'package:starflare/data/enums/git_repo/sort_by.dart';
import 'package:starflare/data/enums/git_repo/sort_order.dart';

class SharedPrefController extends GetxController {
  final sharedPref = GetStorage(StringConstants.spStorageName);

  // observables
  final isDark = false.obs;
  final sortBy = SortBy.STARS.toString().obs;
  final sortOrder = SortOrder.DESC.toString().obs;
  final currentGitRepoPage = 1.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    // initate darkmode sharedpref if not initiated
    sharedPref.writeIfNull(
      StringConstants.spDataDarkModeName,
      false,
    );

    // initate sortBy sharedpref if not initiated
    sharedPref.writeIfNull(
      StringConstants.spDataSortBy,
      SortBy.STARS.toString(),
    );

    // initate sortOrder sharedpref if not initiated
    sharedPref.writeIfNull(
      StringConstants.spDataSortOrder,
      SortOrder.DESC.toString(),
    );

    // initate current repo page sharedpref if not initiated
    sharedPref.writeIfNull(
      StringConstants.spDataCurrentGitRepoPage,
      0,
    );

    //Read darkmode
    setIsDark(
      sharedPref.read(StringConstants.spDataDarkModeName),
    );

    //Read sortBy
    setSortBy(
      sharedPref.read(StringConstants.spDataSortBy),
    );

    //Read sortOrder
    setSortOrder(
      sharedPref.read(StringConstants.spDataSortOrder),
    );

    //Read current git repo page
    setCurrentGitRepoPage(
      sharedPref.read(StringConstants.spDataCurrentGitRepoPage),
    );
  }

  // is dark mode shared pref getter setter
  bool get getIsDark => isDark.value;
  void setIsDark(value) => isDark.value = value;
  ThemeMode get getTheme => isDark.value ? ThemeMode.dark : ThemeMode.light;
  void changeTheme(bool val) {
    sharedPref.write(
      StringConstants.spDataDarkModeName,
      val,
    );

    setIsDark(
      sharedPref.read(StringConstants.spDataDarkModeName),
    );
  }

  // sort by shared pref getter setter
  String get getSortBy => sortBy.value;
  void setSortBy(value) {
    sortBy.value = value;

    sharedPref.write(
      StringConstants.spDataSortBy,
      value,
    );
  }

  // sort order shared pref getter setter
  String get getSortOrder => sortOrder.value;
  void setSortOrder(value) {
    sortOrder.value = value;

    sharedPref.write(
      StringConstants.spDataSortOrder,
      value,
    );
  }

  // current git page shared pref getter setter
  int get getCurrentGitRepoPage => currentGitRepoPage.value;
  void setCurrentGitRepoPage(value) {
    currentGitRepoPage.value = value;

    sharedPref.write(
      StringConstants.spDataCurrentGitRepoPage,
      value,
    );
  }
}
