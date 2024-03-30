import 'dart:convert';
import 'package:get/get.dart';
import 'package:starflare/data/enums/git_repo/sort_by.dart';
import 'package:starflare/data/enums/git_repo/sort_order.dart';
import 'package:starflare/data/models/git_repo/git_user.dart';
import 'package:starflare/data/repositories/git_repo_repository.dart';
import 'package:logger/logger.dart';
import 'package:starflare/data/repositories/git_user_repository.dart';

import '../../../data/database/git_repo_db.dart';
import '../../../data/models/git_repo/repo.dart';
import '../../../data/models/git_repo/repo_summary.dart';
import '../../../global/controllers/shared_preference_controller.dart';
import '../../../routes/app_routes.dart';

class GitRepoController extends GetxController {
  final GitRepoRepository gitRepoRepository;
  final GitUserRepository gitUserRepository;
  final gitRepoDatabase = GitRepoDatabase();

  final SharedPrefController sharedPrefController =
      Get.find<SharedPrefController>(tag: 'sharedPrefController');

  // observables
  final gitRepoSummaries = List<GitRepoSummary>.empty(growable: true).obs;

  final RxInt gitRepoTotalCount = 0.obs;
  final RxBool isLoadingGitRepoSummaries = true.obs;
  final RxInt gitRepoCurrentPage = 1.obs;

  GitRepoController(
    this.gitRepoRepository,
    this.gitUserRepository,
  );

  @override
  Future<void> onInit() async {
    super.onInit();

    // get current git repo page from shared pref
    setGitRepoCurrentPage(
      sharedPrefController.getCurrentGitRepoPage,
    );

    // Querying records
    await gitRepoDatabase.getRepoSummaries().then(
          (value) => gitRepoSummaries.addAll(
            value,
          ),
        );

    await gitRepoDatabase.close();

    await getRepos();
  }

  String get getGitRepoTotalCount => gitRepoTotalCount.value.toString();
  void setGitRepoTotalCount(value) => gitRepoTotalCount.value = value;

  bool get getIsLoadingGitRepoSummaries => isLoadingGitRepoSummaries.value;
  void setIsLoadingGitRepoSummaries(value) =>
      isLoadingGitRepoSummaries.value = value;

  List<GitRepoSummary> get getGitRepoSummaries => gitRepoSummaries;
  void setGitRepoSummaries(value) => gitRepoSummaries.value = value;

  int get getGitRepoCurrentPage => gitRepoCurrentPage.value;
  void setGitRepoCurrentPage(value) => gitRepoCurrentPage.value = value;

  Future<void> getRepos({
    String query = "flutter",
    int perPage = 10,
    String sortBy = "stars",
    String sortOrder = "desc",
  }) async {
    setIsLoadingGitRepoSummaries(true);

    // get
    gitRepoRepository
        .getRepos(
      query: query,
      page: getGitRepoCurrentPage,
      perPage: perPage,
      sortBy: sortBy,
      sortOrder: sortOrder,
    )
        .then(
      (response) async {
        setGitRepoTotalCount(response.data['total_count']);

        List<GitRepoSummary> lGitRepoSummaries = gitRepositorySummaryFromJson(
          jsonEncode(
            response.data['items'],
          ),
        );

        for (var lGitRepoSummary in lGitRepoSummaries) {
          if (!getGitRepoSummaries
              .any((element) => element.id == lGitRepoSummary.id)) {
            getGitRepoSummaries.add(lGitRepoSummary);

            // Add new gitRepoSummary into the local database for future
            await gitRepoDatabase.insertRepoSummaries(
              lGitRepoSummary,
            );
          }
        }

        setIsLoadingGitRepoSummaries(false);

        // save updated page no into local storage
        sharedPrefController.setCurrentGitRepoPage(
          getGitRepoCurrentPage + 1,
        );

        // update git repo current page
        setGitRepoCurrentPage(
          sharedPrefController.getCurrentGitRepoPage,
        );

        Logger().d("Current Page: $getGitRepoCurrentPage");
        Logger().d("Total Count: ${getGitRepoSummaries.length}");
      },
    );
  }

  Future<void> showRepo(url) async {
    GitRepository? gitRepo;
    GitUser? gitUser;

    gitRepoRepository
        .getRepoByUrl(
      url,
    )
        .then(
      (response1) async {
        gitRepo = GitRepository.fromJson(
          response1.data,
        );

        print(gitRepo!.owner!.url);

        gitUserRepository
            .getGitUserByUrl(
          gitRepo?.owner?.url,
        )
            .then(
          (response2) async {
            gitUser = GitUser.fromJson(
              response2.data,
            );

            Get.toNamed(
              Routes.GITREPODETAIL,
              arguments: {
                'gitRepo': gitRepo,
                'gitUser': gitUser,
              },
            );
          },
        );
      },
    );
  }

  void sortRepos() {
    final sortBy = sharedPrefController.getSortBy;
    final sortOrder = sharedPrefController.getSortOrder;
    switch (sortByValues.map[sortBy]) {
      case SortBy.STARS:
        if (sortOrder == SortOrder.ASC.toString()) {
          getGitRepoSummaries.sort(
            (a, b) => a.getStarCount().compareTo(
                  b.getStarCount(),
                ),
          );
        } else {
          getGitRepoSummaries.sort(
            (a, b) => b.getStarCount().compareTo(
                  a.getStarCount(),
                ),
          );
        }
        break;
      case SortBy.UPDATED:
        if (sortOrder == SortOrder.ASC.toString()) {
          getGitRepoSummaries.sort(
            (a, b) => a.getUpdatedAtV2().compareTo(
                  b.getUpdatedAtV2(),
                ),
          );
        } else {
          getGitRepoSummaries.sort(
            (a, b) => b.getUpdatedAtV2().compareTo(
                  a.getUpdatedAtV2(),
                ),
          );
        }
        break;
      case SortBy.CREATED:
        if (sortOrder == SortOrder.ASC.toString()) {
          getGitRepoSummaries.sort(
            (a, b) => a.getCreatedAtV2().compareTo(
                  b.getCreatedAtV2(),
                ),
          );
        } else {
          getGitRepoSummaries.sort(
            (a, b) => b.getCreatedAtV2().compareTo(
                  a.getCreatedAtV2(),
                ),
          );
        }
        break;
      default:
    }
  }
}
