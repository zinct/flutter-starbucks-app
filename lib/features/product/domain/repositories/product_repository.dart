import 'package:dartz/dartz.dart';
import 'package:starbacks/core/errors/failure.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts(
      String? name, ProductCategory? category);
  Future<Either<Failure, List<ProductCategory>>> getProductCategories();
  Future<Either<Failure, Product>> getProduct(String id);
}
