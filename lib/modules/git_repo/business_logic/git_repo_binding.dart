import 'package:get/get.dart';
import 'package:starflare/modules/git_repo/business_logic/git_repo_controller.dart';

class GitRepoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GitRepoController>(
      GitRepoController(),
      tag: 'gitRepoController',
    );
  }
}
