// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:fullstack_challenge/app/ui/home/home_page.dart';
import 'package:fullstack_challenge/app/ui/splash/splash_page.dart';

abstract class Routes {
  static const HOME = '/';
  static const SPLASH = '/splash';
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.HOME: (_) => const HomePage(),
  Routes.SPLASH: (_) => const SplashPage(),
};
