import 'package:dartz/dartz.dart';
import 'package:starbacks/core/errors/failure.dart';
import 'package:starbacks/features/cart/data/datasource/cart_local_datasource.dart';
import 'package:starbacks/features/cart/domain/entities/cart.dart';
import 'package:starbacks/features/cart/domain/repositories/cart_repository.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';

class CartRepositoryV1 extends CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryV1({required this.localDataSource});

  @override
  Future<Either<Failure, List<Cart>>> getListCart() {
    // TODO: implement getListCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> createCart(
    Product product,
    ProductPrice productPrice,
    int quantity,
  ) async {
    await localDataSource.createCart(product, productPrice, quantity);
    return Right(true);
  }
}