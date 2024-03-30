import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../services/providers/git_repo_api.dart';

class GitRepoRepository extends GetxController {
  final GitRepoApi gitRepoApi;

  GitRepoRepository(this.gitRepoApi);

  Future<dynamic> getRepos({
    String query = "flutter",
    int page = 0,
    int perPage = 10,
    String sortBy = "stars",
    String sortOrder = "desc",
  }) async {
    try {
      final response = await gitRepoApi.getRepos(
        query: query,
        page: page,
        perPage: perPage,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );
      return response;
    } on Exception catch (e) {
      // Handle errors appropriately, e.g., using Get.snackbar
      Logger().e(e.toString());

      // Assuming you have access to the BuildContext
      Get.snackbar(
        "Server Error",
        "Frequest Scrolling Detected.",
      );
    }
  }

  Future<dynamic> getRepoByUrl(url) async {
    try {
      final response = await gitRepoApi.getRepoByUrl(url);
      return response;
    } on Exception catch (e) {
      // Handle errors appropriately, e.g., using Get.snackbar
      Logger().e(e.toString());

      // Assuming you have access to the BuildContext
      Get.snackbar(
        "Server Error",
        "Repository not found",
      );
    }
  }
}
