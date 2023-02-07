import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starbacks/features/intro/presentation/cubit/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashStateInitial());

  void start() async {
    emit(SplashStateInitial());
    await Future.delayed(const Duration(seconds: 1));
    emit(SplashStateFinished());
  }
}
