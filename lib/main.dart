import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  await GetStorage('starflare').initStorage;
  // DependencyInjection.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      theme: ThemeData(
        fontFamily: 'Custom_Font',
      ),
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 250),
      getPages: AppPages.pages,
      popGesture: true,
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      title: 'Star Flare',
    );
  }
}
