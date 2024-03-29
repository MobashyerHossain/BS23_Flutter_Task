import 'package:flutter/material.dart';

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
              color: Colors.blueAccent,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ThemeModeToggleButton(),
                ],
              ),
            ),
            Expanded(
              child: screen,
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
