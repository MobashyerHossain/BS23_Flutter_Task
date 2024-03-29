import 'package:get/get.dart';

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
      Get.snackbar(
        "Error",
        "An error occurred while fetching data: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
      return null; // Or throw a specific exception for further handling
    }
  }
}
