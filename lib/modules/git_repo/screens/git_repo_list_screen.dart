import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:starflare/data/models/git_repo/repo_summary.dart';
import 'package:starflare/global/widgets/screen_layout.dart';

import '../../../global/controllers/shared_pref_controller.dart';
import '../business_logic/git_repo_controller.dart';
import '../local_widgets/git_repo_list_item.dart';

class GitRepoListScreen extends StatefulWidget {
  const GitRepoListScreen({super.key});

  @override
  State<GitRepoListScreen> createState() => _GitRepoListScreenState();
}

class _GitRepoListScreenState extends State<GitRepoListScreen> {
  Timer? debounceTimer;

  final ScrollController gitRepoListScreenScroll = ScrollController(
    debugLabel: 'gitRepoListScreenScroll',
  );

  final SharedPrefController sharedPrefController =
      Get.find<SharedPrefController>(tag: 'sharedPrefController');

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
    if (debounceTimer != null && debounceTimer!.isActive) {
      // If the timer is active, ignore the scroll event.
      return;
    }

    // Execute the logic immediately
    if (gitRepoListScreenScroll.offset >=
            gitRepoListScreenScroll.position.maxScrollExtent &&
        !gitRepoListScreenScroll.position.outOfRange) {
      gitRepoController.getRepos(
        sortBy: sharedPrefController.getSortBy,
        sortOrder: sharedPrefController.getSortOrder,
      );

      // Start the debounce timer
      debounceTimer = Timer(const Duration(seconds: 3), () {
        // Reset the debounce timer after 3 seconds
        debounceTimer?.cancel();
        debounceTimer = null;
      });
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
                      final GitRepoSummary gitRepoSummary =
                          gitRepoController.getGitRepoSummaries[index];
                      return GitRepoListItem(
                        gitRepoSummary: gitRepoSummary,
                      );
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
