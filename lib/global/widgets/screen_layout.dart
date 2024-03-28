import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starflare/global/controllers/shared_preference_controller.dart';

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GetX<SharedPrefController>(
                      tag: 'sharedPrefController',
                      builder: (sharedPref) {
                        return ToggleButtons(
                          selectedColor: Colors.greenAccent,
                          borderWidth: 3.0,
                          borderRadius: BorderRadius.circular(10),
                          isSelected: sharedPref.getIsDark
                              ? [true, false]
                              : [false, true],
                          children: const [
                            Icon(
                              Icons.dark_mode,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.light_mode,
                              size: 15.0,
                            ),
                          ],
                          onPressed: (index) => sharedPref.changeTheme(
                            index == 0,
                          ),
                        );
                      },
                    ),
                  ),
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
