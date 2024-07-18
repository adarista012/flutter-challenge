import 'package:flutter/material.dart';
import 'package:fullstack_challenge/app/app.dart';
import 'package:fullstack_challenge/inject_dependencies.dart';

void main() {
  InjectDependencies.init();
  runApp(const App());
}
