import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:starbacks/core/errors/failure.dart';
import 'package:starbacks/core/usecase/usecase.dart';
import 'package:starbacks/features/cart/domain/repositories/cart_repository.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';

class CreateCart extends UseCase<bool, CreateCartParams> {
  final CartRepository repository;

  CreateCart({required this.repository});

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await repository.createCart(
      params.product,
      params.productPrice,
      params.quantity,
    );
  }
}

class CreateCartParams extends Equatable {
  final Product product;
  final ProductPrice productPrice;
  final int quantity;

  const CreateCartParams(this.product, this.productPrice, this.quantity);

  @override
  List<Object?> get props => [];
}
