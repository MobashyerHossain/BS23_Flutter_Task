import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:starflare/data/models/git_repo/git_user.dart';
import 'package:starflare/data/models/git_repo/repo.dart';

import '../../../global/widgets/circular_chip.dart';
import '../../../global/widgets/screen_layout.dart';
import '../local_widgets/prog_language_info.dart';

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
              padding: const EdgeInsets.all(8.0),
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
                        text: gitRepository.visibility.toString(),
                      ),
                    ],
                  ),
                  Row(
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
                            "${gitRepository.stargazersCount}",
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
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
                                "${gitRepository.watchersCount}",
                                style: const TextStyle(
                                  fontSize: 15.0,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          ProgLanguageInfo(
                            fontSize: 15.0,
                            language: gitRepository.language!,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Created At: ${gitRepository.getCreatedAt()}",
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Last Updated At: ${gitRepository.getUpdatedAt()}",
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Last Pushed At: ${gitRepository.getPushedAt()}",
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Size: ${gitRepository.size}",
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Topics: ${gitRepository.getTopics()}",
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  // SizedBox(
                  //   width: 300,
                  //   height: 30,
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: gitRepository.topics!
                  //         .map(
                  //           (topic) => CircularChip(
                  //             text: topic,
                  //           ),
                  //         )
                  //         .toList(),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Description: ${gitRepository.description!}",
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

class UserSummary extends StatelessWidget {
  const UserSummary({
    super.key,
    required this.gitUser,
  });

  final GitUser gitUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: CircleAvatar(
              radius: 40.0,
              child: Image.network(
                gitUser.avatarUrl!,
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      gitUser.name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    CircularChip(
                      text: gitUser.type!,
                    ),
                  ],
                ),
                Text(
                  "Public Repos : ${gitUser.publicRepos}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  "Followers : ${gitUser.followers}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  "Following : ${gitUser.following}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
