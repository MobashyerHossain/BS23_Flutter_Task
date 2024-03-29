import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:starflare/core/constants/string_constants.dart';
import 'package:starflare/data/enums/git_repo/sort_by.dart';
import 'package:starflare/data/enums/git_repo/sort_order.dart';

import '../../modules/git_repo/business_logic/git_repo_controller.dart';

class SharedPrefController extends GetxController {
  final sharedPref = GetStorage(StringConstants.spStorageName);

  final GitRepoController gitRepoController =
      Get.find<GitRepoController>(tag: 'gitRepoController');

  // observables
  final isDark = false.obs;
  final sortBy = SortBy.STARS.toString().obs;
  final sortOrder = SortOrder.DESC.toString().obs;

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

    //Fetch First Round of Data
    gitRepoController.getRepos(
      page: 1,
      sortBy: getSortBy,
      sortOrder: getSortOrder,
    );
  }

  bool get getIsDark => isDark.value;
  void setIsDark(value) => isDark.value = value;
  ThemeMode get getTheme => isDark.value ? ThemeMode.dark : ThemeMode.light;

  String get getSortBy => sortBy.value;
  void setSortBy(value) {
    sortBy.value = value;

    sharedPref.write(
      StringConstants.spDataSortBy,
      value,
    );

    // Sort repo when button pressed
    gitRepoController.sortRepos(
      getSortBy,
      getSortOrder,
    );
  }

  String get getSortOrder => sortOrder.value;
  void setSortOrder(value) {
    sortOrder.value = value;

    sharedPref.write(
      StringConstants.spDataSortOrder,
      value,
    );

    // Sort repo when button pressed
    gitRepoController.sortRepos(
      getSortBy,
      getSortOrder,
    );
  }

  void changeTheme(bool val) {
    sharedPref.write(
      StringConstants.spDataDarkModeName,
      val,
    );

    setIsDark(
      sharedPref.read(StringConstants.spDataDarkModeName),
    );
  }
}
