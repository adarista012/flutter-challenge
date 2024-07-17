import 'package:flutter/material.dart';
import 'package:fullstack_challenge/app/ui/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: Text(
                'FullStack Challenge',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          );
        });
  }
}
