import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:starflare/global/widgets/screen_layout.dart';

class GitRepoListScreen extends StatefulWidget {
  const GitRepoListScreen({super.key});

  @override
  State<GitRepoListScreen> createState() => _GitRepoListScreenState();
}

class _GitRepoListScreenState extends State<GitRepoListScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      screen: Container(
        child: Text("fgsd"),
      ),
    );
  }
}
