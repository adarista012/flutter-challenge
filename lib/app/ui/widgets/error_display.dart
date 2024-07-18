import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget errorDisplay({String text = 'Fetching error'}) =>
    Text(text, style: Theme.of(Get.context!).textTheme.labelSmall);
