import 'package:dartz/dartz.dart';
import 'package:starbacks/core/errors/failure.dart';
import 'package:starbacks/core/usecase/usecase.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';
import 'package:starbacks/features/product/domain/repositories/product_repository.dart';

class GetAllCategory extends UseCase<List<ProductCategory>, NoParams> {
  final ProductRepository repository;

  GetAllCategory({required this.repository});

  @override
  Future<Either<Failure, List<ProductCategory>>> call(NoParams params) async {
    return await repository.getProductCategories();
  }
}
