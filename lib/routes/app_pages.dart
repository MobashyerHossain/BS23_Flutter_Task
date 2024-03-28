import 'package:get/get.dart';
import 'package:starflare/modules/git_repo/business_logic/git_repo_binding.dart';
import 'package:starflare/routes/app_routes.dart';

import '../modules/git_repo/screens/git_repo_list_screen.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      title: 'GitRepoListScreen',
      name: Routes.INITIAL,
      binding: GitRepoBinding(),
      page: () => const GitRepoListScreen(),
    ),
  ];
}
