import 'package:equatable/equatable.dart';
import 'package:starbacks/features/cart/domain/entities/cart.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message, [List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class CriticalFailure extends Failure {
  CriticalFailure(super.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class CartFailure extends Failure {
  final Cart cart;
  CartFailure(this.cart, super.message);

  @override
  // TODO: implement props
  List<Object?> get props => [cart, message];
}
