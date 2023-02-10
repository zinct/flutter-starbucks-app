part of 'product_list_cubit.dart';

abstract class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object> get props => [];
}

class ProductListStateInital extends ProductListState {}

class ProductListStateLoading extends ProductListState {}

class ProductListStateError extends ProductListState {
  final String message;

  ProductListStateError(this.message);
}

class ProductListStateDone extends ProductListState {
  final List<Product> data;

  ProductListStateDone(this.data);
}
