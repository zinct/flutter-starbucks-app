import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starbacks/core/constants/router.dart';
import 'package:starbacks/core/utils/theme_utils.dart';
import 'package:starbacks/features/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:starbacks/features/cart/presentation/screen/cart_screen.dart';
import 'package:starbacks/features/home/presentation/screen/home_screen.dart';
import 'package:starbacks/features/intro/presentation/screen/splash_screen.dart';
import 'package:starbacks/features/main/presentation/screen/main_screen.dart';
import 'package:starbacks/features/product/presentation/screen/product_detail_screen.dart';
import 'package:starbacks/features/product/presentation/screen/product_list_screen.dart';
import 'package:starbacks/firebase_options.dart';
import 'package:starbacks/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding();
  di.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initFirebase();
  }

  void _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => di.getIt<CartCubit>()..getListCart()),
        ],
        child: MaterialApp(
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
        ));
  }
}
