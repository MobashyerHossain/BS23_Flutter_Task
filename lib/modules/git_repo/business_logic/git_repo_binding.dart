import 'package:get/get.dart';
import 'package:starflare/data/repositories/git_user_repository.dart';
import 'package:starflare/services/providers/git_repo_api.dart';
import 'package:starflare/data/repositories/git_repo_repository.dart';
import 'package:starflare/modules/git_repo/business_logic/git_repo_controller.dart';
import 'package:starflare/services/providers/git_user_api.dart';

class GitRepoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GitRepoController>(
      tag: 'gitRepoController',
      GitRepoController(
        GitRepoRepository(
          GitRepoApi(),
        ),
        GitUserRepository(
          GitUserApi(),
        ),
      ),
    );
  }
}
