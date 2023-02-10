import 'package:bloc/bloc.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';

class ProductPriceCubit extends Cubit<ProductPrice> {
  ProductPrice selectedPrice;

  ProductPriceCubit(this.selectedPrice) : super(selectedPrice);

  void changePrice(ProductPrice value) {
    emit(selectedPrice = value);
  }
}
