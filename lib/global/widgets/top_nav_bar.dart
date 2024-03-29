import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/shared_preference_controller.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          IconButton(
            icon: const Icon(
              Icons.menu,
              // color: ADNColorConstants.kADNWhite,
            ),
            tooltip: 'Menu',
            onPressed: () {
              if (!Scaffold.of(context).isEndDrawerOpen) {
                Scaffold.of(context).openEndDrawer();
              }
            },
          )
        ],
      ),
    );
  }
}
