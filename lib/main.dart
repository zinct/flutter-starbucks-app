import 'package:flutter/material.dart';

import 'package:starbacks/core/constants/router.dart';
import 'package:starbacks/core/utils/theme_utils.dart';
import 'package:starbacks/features/cart/screen/cart_screen.dart';
import 'package:starbacks/features/home/home_screen.dart';
import 'package:starbacks/features/main/screen/main_screen.dart';

import 'package:starbacks/features/intro/presentation/screen/splash_screen.dart';
import 'package:starbacks/features/product/screen/product_detail_screen.dart';
import 'package:starbacks/features/product/screen/product_list_screen.dart';

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
        ROUTER.MAIN: (context) => MainScreen(),
        ROUTER.HOME: (context) => const HomeScreen(),
        ROUTER.PRODUCT_DETAIl: (context) => const ProductDetailScreen(),
        ROUTER.PRODUCT_LIST: (context) => const ProductListScreen(),
        ROUTER.CART: (context) => const CartScreen(),
      },
    );
  }
}
