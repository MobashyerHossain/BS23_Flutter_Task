import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:starflare/services/providers/git_user_api.dart';

class GitUserRepository extends GetxController {
  final GitUserApi gitUserApi;

  GitUserRepository(this.gitUserApi);

  Future<dynamic> getGitUserByUrl(url) async {
    try {
      final response = await gitUserApi.getGitUserByUrl(url);
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
