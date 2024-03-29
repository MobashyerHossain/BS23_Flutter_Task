import 'package:get/get.dart';
import 'package:starflare/global/controllers/shared_preference_controller.dart';

import '../../data/repositories/git_repo_repository.dart';
import '../../modules/git_repo/business_logic/git_repo_controller.dart';
import '../../services/providers/git_repo_api.dart';

class DependencyInjection {
  static void init() async {
    Get.put<GitRepoController>(
      GitRepoController(
        GitRepoRepository(
          GitRepoApi(),
        ),
      ),
      tag: 'gitRepoController',
    );
    Get.put<SharedPrefController>(
      SharedPrefController(),
      tag: 'sharedPrefController',
      permanent: true,
    );
  }
}
