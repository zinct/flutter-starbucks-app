import 'package:dartz/dartz.dart';
import 'package:starbacks/core/errors/failure.dart';
import 'package:starbacks/core/usecase/usecase.dart';
import 'package:starbacks/features/cart/domain/entities/cart.dart';
import 'package:starbacks/features/cart/domain/repositories/cart_repository.dart';

class GetListCart extends UseCase<List<Cart>, NoParams> {
  final CartRepository repository;

  GetListCart({required this.repository});

  @override
  Future<Either<Failure, List<Cart>>> call(NoParams params) async {
    return await repository.getListCart();
  }
}
