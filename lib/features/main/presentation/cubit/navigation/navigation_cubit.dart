import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  int position = 0;

  void changePosition(int newPosition) {
    this.position = newPosition;
    emit(position);
  }
}
