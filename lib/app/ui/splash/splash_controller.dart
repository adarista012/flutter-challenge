import 'package:fullstack_challenge/app/ui/home/home_page.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

class SplashController extends GetxController {
  SplashController() {
    _init();
  }
  _init() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offAll(const HomePage());
  }
}
