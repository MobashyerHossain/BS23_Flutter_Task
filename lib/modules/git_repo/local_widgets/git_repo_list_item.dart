import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/constants/color_constants.dart';
import '../../../data/models/git_repo/repo_summary.dart';
import '../../../global/widgets/circular_chip.dart';

class GitRepoListItem extends StatelessWidget {
  const GitRepoListItem({
    super.key,
    required this.gitRepoSummary,
  });

  final GitRepositorySummary gitRepoSummary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 3.0,
      ),
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
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: Text(
                gitRepoSummary.getDescription(),
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
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  gitRepoSummary.getUpdatedAtV1(),
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProgLanguageInfo extends StatelessWidget {
  const ProgLanguageInfo({
    super.key,
    required this.language,
  });

  final String language;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.circle_rounded,
          size: 12.0,
          color: ColorConstants.getColorByLanguage(language),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          language,
          style: const TextStyle(
            fontSize: 12.0,
          ),
        )
      ],
    );
  }
}
