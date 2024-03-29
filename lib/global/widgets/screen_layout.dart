import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starflare/global/controllers/shared_preference_controller.dart';

import 'side_drawer.dart';
import 'top_nav_bar.dart';

class ScreenLayout extends StatelessWidget {
  final Widget screen;
  const ScreenLayout({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const SideDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TopNavBar(),
            Expanded(
              child: GetX<SharedPrefController>(
                tag: "sharedPrefController",
                builder: (sharedPrefController) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: sharedPrefController.getIsDark
                            ? [
                                Colors.black,
                                Colors.black87,
                              ]
                            : [
                                Colors.white,
                                Colors.white70,
                              ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: screen,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
