import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../core/constants/string_constants.dart';
import '../core/utils/dependency_injection.dart';
import '../global/controllers/shared_pref_controller.dart';
import '../routes/app_pages.dart';
import '../routes/app_routes.dart';

void main() async {
  await GetStorage.init(StringConstants.spStorageName);
  DependencyInjection.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetX<SharedPrefController>(
      tag: 'sharedPrefController',
      builder: (sharedPref) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.SPLASH,
          darkTheme: ThemeData.dark(
            useMaterial3: true,
          ),
          theme: ThemeData.light(
            useMaterial3: true,
          ),
          themeMode: sharedPref.getTheme,
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
      },
    );
  }
}
