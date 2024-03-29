import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starflare/global/controllers/shared_preference_controller.dart';

import 'theme_mode_toggle_button.dart';

class ScreenLayout extends StatelessWidget {
  final Widget screen;
  const ScreenLayout({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.greenAccent,
                    Colors.blueAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GetX<SharedPrefController>(
                      tag: "sharedPrefController",
                      builder: (sharedPrefController) {
                        return Image.asset(
                          'assets/logos/github2.png',
                          color: sharedPrefController.getIsDark
                              ? Colors.white
                              : Colors.black,
                        );
                      },
                    ),
                  ),
                  const Text(
                    "Star Flare",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const ThemeModeToggleButton(),
                ],
              ),
            ),
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
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: icon)
      //   ],
      // ),
    );
  }
}
