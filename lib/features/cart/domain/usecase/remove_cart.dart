import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:starbacks/core/errors/failure.dart';
import 'package:starbacks/core/usecase/usecase.dart';
import 'package:starbacks/features/cart/domain/entities/cart.dart';
import 'package:starbacks/features/cart/domain/repositories/cart_repository.dart';

class RemoveCart extends UseCase<bool, RemoveCartparams> {
  final CartRepository repository;

  RemoveCart({required this.repository});

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await repository.removeCart(params.cart);
  }
}

class RemoveCartparams extends Equatable {
  final Cart cart;

  const RemoveCartparams(this.cart);

  @override
  List<Object?> get props => [cart];
}
