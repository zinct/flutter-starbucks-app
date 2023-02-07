import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starbacks/core/constants/router.dart';
import 'package:starbacks/features/intro/presentation/cubit/splash/splash_cubit.dart';
import 'package:starbacks/features/intro/presentation/cubit/splash/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..start(),
      child: SplashScreenWidget(),
    );
  }
}

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashStateFinished) {
          Navigator.of(context).pushReplacementNamed(ROUTER.MAIN);
        }
      },
      child: Scaffold(
        body: Center(child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}
