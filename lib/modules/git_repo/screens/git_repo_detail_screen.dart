import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starflare/data/models/git_repo/git_user.dart';
import 'package:starflare/data/models/git_repo/git_repo.dart';

import '../../../global/widgets/helpers/circular_chip.dart';
import '../../../global/widgets/helpers/topic_data_line.dart';
import '../../../global/widgets/screen_layout.dart';
import '../local_widgets/prog_language_info.dart';
import '../local_widgets/user_summary.dart';

class GitRepoDetailScreen extends StatefulWidget {
  const GitRepoDetailScreen({super.key});

  @override
  State<GitRepoDetailScreen> createState() => _GitRepoDetailScreenState();
}

class _GitRepoDetailScreenState extends State<GitRepoDetailScreen> {
  final GitRepository gitRepository = Get.arguments['gitRepo'];
  final GitUser gitUser = Get.arguments['gitUser'];
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      screen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserSummary(
            gitUser: gitUser,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(
              height: 15.0,
              thickness: 2.0,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 8.0,
              ),
              child: ListView(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          gitRepository.name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      CircularChip(
                        text: gitRepository.getVisibility(),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      CircularChip(
                        text: gitRepository.getDefaultBranch(),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 17.0,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            gitRepository.getStargazersCount(),
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.remove_red_eye,
                            size: 17.0,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            gitRepository.getWatchersCount(),
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      ),
                      TopicDataLine(
                        topic: "Score",
                        data: gitRepository.getScore(),
                      ),
                      ProgLanguageInfo(
                        fontSize: 15.0,
                        language: gitRepository.getLanguage(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TopicDataLine(
                    topic: "Created At",
                    data: gitRepository.getCreatedAt(),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TopicDataLine(
                    topic: "Last Updated At",
                    data: gitRepository.getUpdatedAt(),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TopicDataLine(
                    topic: "Last Pushed At",
                    data: gitRepository.getPushedAt(),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TopicDataLine(
                    topic: "Size",
                    data: gitRepository.getSize(),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text(
                    "Topics",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: 30.0,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: gitRepository.getTopics().length,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircularChip(
                              fontSize: 12.0,
                              text: gitRepository.getTopics()[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    gitRepository.description ?? 'No Description Provided',
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
