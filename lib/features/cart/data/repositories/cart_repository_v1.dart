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
  Future<Either<Failure, List<Cart>>> getListCart() async {
    var data = await localDataSource.getListCart();
    return Right(data);
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

  @override
  Future<Either<Failure, List<Cart>>> changeQuantity(
      Cart cart, int quantity) async {
    var data = await localDataSource.changeQuantity(cart, quantity);
    return Right(data);
  }

  @override
  Future<Either<Failure, bool>> emptyCart() async {
    try {
      await localDataSource.emptyCart();
      return Right(true);
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<Either<Failure, bool>> removeCart(Cart cart) async {
    try {
      await localDataSource.removeCart(cart);
      return Right(true);
    } catch (err) {
      throw err;
    }
  }
}
