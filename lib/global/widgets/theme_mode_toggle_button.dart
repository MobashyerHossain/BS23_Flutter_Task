import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/shared_preference_controller.dart';

class ThemeModeToggleButton extends StatelessWidget {
  const ThemeModeToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GetX<SharedPrefController>(
        tag: 'sharedPrefController',
        builder: (sharedPref) {
          return ToggleButtons(
            selectedColor: Colors.greenAccent,
            borderWidth: 3.0,
            borderRadius: BorderRadius.circular(20),
            isSelected: sharedPref.getIsDark ? [true, false] : [false, true],
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
    );
  }
}
