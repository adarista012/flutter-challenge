import 'package:fullstack_challenge/app_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

class SplashController extends GetxController {
  String? _routeName;

  SplashController() {
    _init();
  }
  _init() async {
    _routeName = await Future.delayed(
      const Duration(seconds: 2),
      () => Routes.HOME,
    );

    if (_routeName != null) {
      Get.offAllNamed(_routeName!);
    }
  }
}
