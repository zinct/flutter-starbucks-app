import 'package:bloc/bloc.dart';
import 'package:starbacks/core/usecase/usecase.dart';
import 'package:starbacks/features/cart/domain/entities/cart.dart';
import 'package:starbacks/features/cart/domain/usecase/create_cart.dart';
import 'package:starbacks/features/cart/domain/usecase/get_list_cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  GetListCart getListCartUsecase;
  CreateCart createCartUsecase;

  CartCubit({
    required this.getListCartUsecase,
    required this.createCartUsecase,
  }) : super(CartState());

  void getListCart() async {
    emit(state.copyWith(status: CartStatus.loading));
    var data = await getListCartUsecase(NoParams());
    data.fold((l) => emit(state.copyWith(status: CartStatus.failure)),
        (r) => emit(state.copyWith(status: CartStatus.done, cart: r)));
  }

  void createCart(CreateCartParams params) async {
    var data = await createCartUsecase(params);
    data.fold((l) => emit(state.copyWith(status: CartStatus.failure)),
        (r) => emit(state.copyWith(status: CartStatus.added)));
  }
}
