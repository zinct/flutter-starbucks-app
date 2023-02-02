import 'package:flutter/material.dart';

import 'package:starbacks/core/constants/router.dart';
import 'package:starbacks/core/utils/theme_utils.dart';

import 'package:starbacks/feature/main/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: ROUTER.SPLASH,
      routes: {
        ROUTER.SPLASH: (context) => const SplashScreen(),
      },
    );
  }
}
