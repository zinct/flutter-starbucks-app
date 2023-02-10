import 'package:dartz/dartz.dart';
import 'package:starbacks/core/errors/failure.dart';
import 'package:starbacks/features/product/data/datasource/product_remote_datasource.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';
import 'package:starbacks/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryV1 implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryV1({required this.remoteDataSource});

  @override
  Future<Either<Failure, Product>> getProduct(String id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts(
      String? name, ProductCategory? category) async {
    try {
      var data = await remoteDataSource.getProducts(name, category);
      return Right(data.data);
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<Either<Failure, List<ProductCategory>>> getProductCategories() async {
    try {
      var data = await remoteDataSource.getProductCategories();
      return Right(data.data);
    } catch (err) {
      throw err;
    }
  }
}
