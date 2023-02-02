import 'package:flutter/material.dart';

import 'package:starbacks/core/constants/router.dart';
import 'package:starbacks/core/utils/theme_utils.dart';
import 'package:starbacks/feature/home/home_screen.dart';
import 'package:starbacks/feature/main/screen/main_screen.dart';

import 'package:starbacks/feature/main/screen/splash_screen.dart';
import 'package:starbacks/feature/product/screen/product_detail.dart';

// https://dribbble.com/shots/14218915-Starbucks-App-Concept

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
        ROUTER.MAIN: (context) => const MainScreen(),
        ROUTER.HOME: (context) => const HomeScreen(),
        ROUTER.PRODUCT_DETAIl: (context) => const ProductDetail(),
      },
    );
  }
}
