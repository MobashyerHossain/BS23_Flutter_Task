import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate initialization process
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the main screen
      Get.offAndToNamed(
        Routes.GITREPOLIST,
      );
    });

    return Scaffold(
      body: Center(
        // You can use Image.asset or any widget you like for your splash screen
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: FadeOut(
              child: ElasticIn(
                child: Image.asset(
                  'assets/logos/github2.png',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
