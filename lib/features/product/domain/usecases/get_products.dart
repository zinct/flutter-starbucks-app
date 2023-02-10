import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:starbacks/core/errors/failure.dart';
import 'package:starbacks/core/usecase/usecase.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';
import 'package:starbacks/features/product/domain/repositories/product_repository.dart';

class GetProducts extends UseCase<List<Product>, GetProductsParams> {
  final ProductRepository repository;

  GetProducts({required this.repository});

  @override
  Future<Either<Failure, List<Product>>> call(GetProductsParams params) async {
    return await repository.getProducts(params.name, params.category);
  }
}

class GetProductsParams extends Equatable {
  final String? name;
  final ProductCategory? category;

  const GetProductsParams(this.name, this.category);

  @override
  List<Object?> get props => [name, category];
}
