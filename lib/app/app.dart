import 'package:flutter/material.dart';
import 'package:fullstack_challenge/app_navigation.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      navigatorObservers: [GetObserver()],
      routes: appRoutes,
      initialRoute: Routes.SPLASH,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
    );
  }
}
