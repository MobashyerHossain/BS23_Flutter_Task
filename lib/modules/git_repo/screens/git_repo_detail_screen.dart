import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starflare/data/models/git_repo/repo_summary.dart';

import '../../../global/widgets/screen_layout.dart';

class GitRepoDetailScreen extends StatefulWidget {
  const GitRepoDetailScreen({super.key});

  @override
  State<GitRepoDetailScreen> createState() => _GitRepoDetailScreenState();
}

class _GitRepoDetailScreenState extends State<GitRepoDetailScreen> {
  final GitRepoSummary gitRepoSummary = Get.arguments['gitRepoSummary'];
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      screen: Container(
        child: Text(gitRepoSummary.getFullName()),
      ),
    );
  }
}
