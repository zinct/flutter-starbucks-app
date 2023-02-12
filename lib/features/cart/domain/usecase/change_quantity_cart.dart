import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:starbacks/core/errors/failure.dart';
import 'package:starbacks/core/usecase/usecase.dart';
import 'package:starbacks/features/cart/domain/entities/cart.dart';
import 'package:starbacks/features/cart/domain/repositories/cart_repository.dart';

enum ChangeQuantityCartAction { increment, decrement }

class ChangeQuantityCart extends UseCase<List<Cart>, ChangeQuantityCartParams> {
  final CartRepository repository;

  ChangeQuantityCart({required this.repository});

  @override
  Future<Either<Failure, List<Cart>>> call(params) async {
    int quantity;

    if (params.status == ChangeQuantityCartAction.increment) {
      quantity = params.cart.quantity + 1;
    } else {
      if (params.cart.quantity <= 1)
        throw CartFailure(params.cart,
            'Cannot reduce the quantity to less than or equal to 0.');
      quantity = params.cart.quantity - 1;
    }

    return await repository.changeQuantity(params.cart, quantity);
  }
}

class ChangeQuantityCartParams extends Equatable {
  final Cart cart;
  final ChangeQuantityCartAction status;

  const ChangeQuantityCartParams(this.cart, this.status);

  @override
  List<Object?> get props => [];
}
