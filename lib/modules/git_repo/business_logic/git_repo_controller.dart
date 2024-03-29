import 'dart:convert';

import 'package:get/get.dart';
import 'package:starflare/data/repositories/git_repo_repository.dart';
import 'package:logger/logger.dart';

import '../../../data/models/git_repo/repo_summary.dart';

class GitRepoController extends GetxController {
  final GitRepoRepository gitRepoRepository;

  // observables
  final gitRepoSummaries = List<GitRepositorySummary>.empty(growable: true).obs;

  final RxInt gitRepoTotalCount = 0.obs;
  final RxBool isLoadingGitRepoSummaries = false.obs;

  GitRepoController(this.gitRepoRepository);

  @override
  Future<void> onInit() async {
    super.onInit();

    await getRepos(
      page: 0,
    );
  }

  String get getGitRepoTotalCount => gitRepoTotalCount.value.toString();
  void setGitRepoTotalCount(value) => gitRepoTotalCount.value = value;

  bool get getIsLoadingGitRepoSummaries => isLoadingGitRepoSummaries.value;
  void setIsLoadingGitRepoSummaries(value) =>
      isLoadingGitRepoSummaries.value = value;

  List<GitRepositorySummary> get getGitRepoSummaries => gitRepoSummaries;
  void setGitRepoSummaries(value) => gitRepoSummaries.value = value;

  Future<void> getRepos({
    int page = 0,
  }) async {
    setIsLoadingGitRepoSummaries(true);
    gitRepoRepository
        .getRepos(
      page: page,
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
}
