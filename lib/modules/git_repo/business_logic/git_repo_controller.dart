import 'dart:convert';

import 'package:get/get.dart';
import 'package:starflare/data/enums/git_repo/sort_by.dart';
import 'package:starflare/data/enums/git_repo/sort_order.dart';
import 'package:starflare/data/repositories/git_repo_repository.dart';
import 'package:logger/logger.dart';

import '../../../data/models/git_repo/repo_summary.dart';

class GitRepoController extends GetxController {
  final GitRepoRepository gitRepoRepository;

  // observables
  final gitRepoSummaries = List<GitRepoSummary>.empty(growable: true).obs;

  final RxInt gitRepoTotalCount = 0.obs;
  final RxBool isLoadingGitRepoSummaries = false.obs;

  GitRepoController(this.gitRepoRepository);

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  String get getGitRepoTotalCount => gitRepoTotalCount.value.toString();
  void setGitRepoTotalCount(value) => gitRepoTotalCount.value = value;

  bool get getIsLoadingGitRepoSummaries => isLoadingGitRepoSummaries.value;
  void setIsLoadingGitRepoSummaries(value) =>
      isLoadingGitRepoSummaries.value = value;

  List<GitRepoSummary> get getGitRepoSummaries => gitRepoSummaries;
  void setGitRepoSummaries(value) => gitRepoSummaries.value = value;

  Future<void> getRepos({
    String query = "flutter",
    int page = 1,
    int perPage = 10,
    String sortBy = "stars",
    String sortOrder = "desc",
  }) async {
    setIsLoadingGitRepoSummaries(true);
    gitRepoRepository
        .getRepos(
      query: query,
      page: page,
      perPage: perPage,
      sortBy: sortBy,
      sortOrder: sortOrder,
    )
        .then(
      (response) {
        setGitRepoTotalCount(response.data['total_count']);

        getGitRepoSummaries.addAll(
          gitRepositorySummaryFromJson(
            jsonEncode(
              response.data['items'],
            ),
          ),
        );

        Logger().d("Total Count: ${getGitRepoSummaries.length}");

        setIsLoadingGitRepoSummaries(false);
      },
    ).onError(
      (error, stackTrace) {
        Logger().e(error.toString());
        Logger().e(stackTrace.toString());
      },
    );
  }

  void sortRepos(
    String sortBy,
    String sortOrder,
  ) {
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
