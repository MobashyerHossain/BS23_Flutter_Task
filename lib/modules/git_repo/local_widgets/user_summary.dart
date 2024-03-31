import 'package:flutter/material.dart';

import '../../../data/models/git_repo/git_user.dart';
import '../../../global/widgets/helpers/circular_chip.dart';
import '../../../global/widgets/helpers/topic_data_line.dart';

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
                gitUser.avatarUrl ?? "Unknown",
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    size: 40.0,
                  );
                },
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
                      gitUser.getName(),
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
                      text: gitUser.getType(),
                    ),
                  ],
                ),
                TopicDataLine(
                  fontSize: 12.0,
                  topic: "Public Repos",
                  data: gitUser.getPublicRepos(),
                ),
                TopicDataLine(
                  fontSize: 12.0,
                  topic: "Followers",
                  data: gitUser.getFollowers(),
                ),
                TopicDataLine(
                  fontSize: 12.0,
                  topic: "Following",
                  data: gitUser.getFollowing(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
