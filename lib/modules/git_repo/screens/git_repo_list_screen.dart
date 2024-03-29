import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:starflare/data/models/git_repo/repo_summary.dart';
import 'package:starflare/global/widgets/screen_layout.dart';

import '../business_logic/git_repo_controller.dart';
import '../local_widgets/git_repo_list_item.dart';

class GitRepoListScreen extends StatefulWidget {
  const GitRepoListScreen({super.key});

  @override
  State<GitRepoListScreen> createState() => _GitRepoListScreenState();
}

class _GitRepoListScreenState extends State<GitRepoListScreen> {
  final ScrollController gitRepoListScreenScroll = ScrollController(
    debugLabel: 'gitRepoListScreenScroll',
  );

  final GitRepoController gitRepoController =
      Get.find<GitRepoController>(tag: 'gitRepoController');

  @override
  void initState() {
    super.initState();
    gitRepoListScreenScroll.addListener(scrollListener);
  }

  @override
  void dispose() {
    gitRepoListScreenScroll.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (gitRepoListScreenScroll.offset >=
            gitRepoListScreenScroll.position.maxScrollExtent &&
        !gitRepoListScreenScroll.position.outOfRange) {
      gitRepoController.getRepos(
        page: 1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      screen: Obx(
        () {
          return gitRepoController.getGitRepoSummaries.isEmpty
              ? Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.blueAccent,
                    size: 40,
                  ),
                )
              : ListView.separated(
                  controller: gitRepoListScreenScroll,
                  itemCount: gitRepoController.getIsLoadingGitRepoSummaries
                      ? gitRepoController.getGitRepoSummaries.length + 1
                      : gitRepoController.getGitRepoSummaries.length,
                  itemBuilder: (context, index) {
                    if (index == gitRepoController.getGitRepoSummaries.length) {
                      return Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.blueAccent,
                          size: 40,
                        ),
                      );
                    } else {
                      final GitRepositorySummary gitRepoSummary =
                          gitRepoController.getGitRepoSummaries[index];
                      return GitRepoListItem(
                        gitRepoSummary: gitRepoSummary,
                      );
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: SizedBox(
                        height: 2.0,
                        child: ColoredBox(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
