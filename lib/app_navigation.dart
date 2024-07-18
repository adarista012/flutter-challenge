// ignore_for_file: constant_identifier_names
import 'package:fullstack_challenge/app/ui/home/home_page.dart';
import 'package:fullstack_challenge/app/ui/splash/splash_binding.dart';
import 'package:fullstack_challenge/app/ui/splash/splash_page.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const HOME = '/';
  static const SPLASH = '/splash';
}

final appRoutes = [
  GetPage(
    name: Routes.SPLASH,
    page: () => const SplashPage(),
    preventDuplicates: true,
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.HOME,
    page: () => const HomePage(),
    transition: Transition.circularReveal,
    transitionDuration: const Duration(milliseconds: 1240),
  ),
];
