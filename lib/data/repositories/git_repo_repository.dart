import 'package:get/get.dart';

import '../../services/providers/git_repo_api.dart';

class GitRepoRepository extends GetxController {
  final GitRepoApi gitRepoApi;

  GitRepoRepository(this.gitRepoApi);

  Future<dynamic> getRepos({
    int page = 0,
  }) async {
    try {
      final response = await gitRepoApi.getRepos(
        page: page,
      );
      return response;
    } on Exception catch (e) {
      // Handle errors appropriately, e.g., using Get.snackbar
      Get.snackbar(
        "Error",
        "An error occurred while fetching data: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
      return null; // Or throw a specific exception for further handling
    }
  }
}
