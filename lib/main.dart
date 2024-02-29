import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskmaster/presentation/app_root.dart';

void main() async {
  AppRoot.instance = AppRoot();

  runZoned<Future<void>>(() async {
    await AppRoot.instance.setup();
    runApp(AppRoot.instance);
  });
}
