import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';
import 'package:starbacks/features/product/domain/usecases/get_products.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final GetProducts usecase;

  ProductListCubit({required this.usecase}) : super(ProductListStateInital());

  Future<void> getData() async {
    emit(ProductListStateLoading());

    var data = await usecase.call(GetProductsParams(null, null));

    data.fold((l) {
      emit(ProductListStateError(l.message));
    }, (r) => emit(ProductListStateDone(r)));
  }
}
