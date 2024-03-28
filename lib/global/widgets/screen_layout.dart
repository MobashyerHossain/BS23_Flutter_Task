import 'package:flutter/material.dart';

class ScreenLayout extends StatelessWidget {
  final Widget screen;
  const ScreenLayout({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: screen,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: icon)
      //   ],
      // ),
    );
  }
}
