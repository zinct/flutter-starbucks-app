import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starbacks/core/usecase/usecase.dart';
import 'package:starbacks/features/cart/domain/entities/cart.dart';
import 'package:starbacks/features/cart/domain/usecase/change_quantity_cart.dart';
import 'package:starbacks/features/cart/domain/usecase/create_cart.dart';
import 'package:starbacks/features/cart/domain/usecase/empty_cart.dart';
import 'package:starbacks/features/cart/domain/usecase/get_list_cart.dart';
import 'package:starbacks/features/cart/domain/usecase/remove_cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  GetListCart getListCartUsecase;
  CreateCart createCartUsecase;
  ChangeQuantityCart changeQuantityCart;
  EmptyCart emptyCartUsecase;
  RemoveCart removeCartUseCase;

  CartCubit({
    required this.getListCartUsecase,
    required this.createCartUsecase,
    required this.changeQuantityCart,
    required this.emptyCartUsecase,
    required this.removeCartUseCase,
  }) : super(CartState());

  void getListCart() async {
    emit(state.copyWith(status: CartStatus.loading));
    var data = await getListCartUsecase(NoParams());
    data.fold((l) => emit(state.copyWith(status: CartStatus.failure)),
        (r) => emit(state.copyWith(status: CartStatus.done, cart: r)));
  }

  void emptyCart() async {
    emit(state.copyWith(status: CartStatus.loading));
    await Future.delayed(Duration(seconds: 2));
    var data = await emptyCartUsecase(NoParams());
    data.fold((l) => emit(state.copyWith(status: CartStatus.failure)),
        (r) => emit(state.copyWith(cart: [], status: CartStatus.done)));
  }

  void createCart(CreateCartParams params) async {
    var data = await createCartUsecase(params);
    data.fold((l) => emit(state.copyWith(status: CartStatus.failure)), (r) {
      emit(state.copyWith(status: CartStatus.added));
      emit(state.copyWith(status: CartStatus.done));
    });
  }

  void changeQuantity(Cart cart, ChangeQuantityCartAction action) async {
    var data = await changeQuantityCart(ChangeQuantityCartParams(cart, action));
    data.fold((l) => emit(state.copyWith(status: CartStatus.failure)), (r) {
      emit(state.copyWith(cart: r));
    });
  }

  void removeCart(RemoveCartparams params) async {
    var data = await removeCartUseCase(params);
    data.fold((l) => emit(state.copyWith(status: CartStatus.failure)), (r) {
      List<Cart> removedCart = state.cart;
      removedCart.remove(params.cart);
      emit(state.copyWith(status: CartStatus.removed));
      emit(state.copyWith(status: CartStatus.done, cart: removedCart));
    });
  }
}
