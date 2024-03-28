import 'package:get/get.dart';
import 'package:starflare/global/controllers/shared_preference_controller.dart';

class DependencyInjection {
  static void init() async {
    Get.put<SharedPrefController>(
      SharedPrefController(),
      tag: 'sharedPrefController',
      permanent: true,
    );
  }
}
