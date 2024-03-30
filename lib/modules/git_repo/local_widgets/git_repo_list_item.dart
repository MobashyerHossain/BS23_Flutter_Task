import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/git_repo/repo_summary.dart';
import '../../../global/widgets/circular_chip.dart';
import '../business_logic/git_repo_controller.dart';
import 'prog_language_info.dart';

class GitRepoListItem extends StatelessWidget {
  const GitRepoListItem({
    super.key,
    required this.gitRepoSummary,
  });

  final GitRepoSummary gitRepoSummary;

  @override
  Widget build(BuildContext context) {
    final GitRepoController gitRepoController =
        Get.find<GitRepoController>(tag: 'gitRepoController');

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 3.0,
      ),
      child: GestureDetector(
        onTap: () {
          gitRepoController.showRepo(gitRepoSummary.url);
        },
        child: ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  gitRepoSummary.getFullName(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              CircularChip(
                text: gitRepoSummary.getVisibility(),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: Text(
                  gitRepoSummary.getDescription(),
                  textAlign: TextAlign.justify,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: ProgLanguageInfo(
                      language: gitRepoSummary.getLanguage(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_border_outlined,
                          size: 14.0,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          gitRepoSummary.getStargazersCount(),
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    gitRepoSummary.getUpdatedAtV1(),
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
