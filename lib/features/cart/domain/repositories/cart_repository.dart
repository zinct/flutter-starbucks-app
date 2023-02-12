import 'package:dartz/dartz.dart';
import 'package:starbacks/core/errors/failure.dart';
import 'package:starbacks/features/cart/domain/entities/cart.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Cart>>> getListCart();
  Future<Either<Failure, bool>> createCart(
      Product product, ProductPrice productPrice, int quantity);
  Future<Either<Failure, bool>> removeCart(Cart cart);
  Future<Either<Failure, bool>> emptyCart();
  Future<Either<Failure, List<Cart>>> changeQuantity(Cart cart, int quantity);
}
