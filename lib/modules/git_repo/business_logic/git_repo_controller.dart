import 'package:get/get.dart';
import 'package:starflare/data/models/git_repo/repo.dart';
import 'package:starflare/data/repositories/git_repo_repository.dart';
import 'package:logger/logger.dart';

class GitRepoController extends GetxController {
  final GitRepoRepository gitRepoRepository;

  // observables
  final gitRepositories = List<GitRepository>.empty(growable: true).obs;

  final RxInt gitRepoTotalCount = 0.obs;

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

  Future<void> getRepos({
    int page = 0,
  }) async {
    gitRepoRepository
        .getRepos(
      page: page,
    )
        .then(
      (response) {
        setGitRepoTotalCount(response.data['total_count']);

        response.data['items'].map(
          (gitRepoItem) {
            gitRepositories.add(
              GitRepository.fromJson(gitRepoItem),
            );
          },
        ).toList();
      },
    ).onError(
      (error, stackTrace) {
        Logger().e(error.toString());
        Logger().e(stackTrace.toString());
      },
    );
  }
}
