import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_router_example/views/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: Splash()));
}