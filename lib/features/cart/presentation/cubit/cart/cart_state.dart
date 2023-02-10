part of 'cart_cubit.dart';

enum CartStatus { initial, loading, done, failure, added }

class CartState {
  final List<Cart> cart;
  final CartStatus status;

  CartState({
    this.status = CartStatus.initial,
    this.cart = const [],
  });

  CartState copyWith({
    CartStatus? status,
    List<Cart>? cart,
  }) {
    return CartState(
      status: status ?? this.status,
      cart: cart ?? this.cart,
    );
  }
}
