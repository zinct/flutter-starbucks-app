import 'package:dartz/dartz.dart';
import 'package:starbacks/core/errors/failure.dart';
import 'package:starbacks/core/usecase/usecase.dart';
import 'package:starbacks/features/cart/domain/repositories/cart_repository.dart';

class EmptyCart extends UseCase<bool, NoParams> {
  final CartRepository repository;

  EmptyCart({required this.repository});

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await repository.emptyCart();
  }
}
