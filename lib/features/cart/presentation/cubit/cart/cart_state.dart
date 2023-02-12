part of 'cart_cubit.dart';

enum CartStatus { initial, loading, done, failure, added, removed }

class CartState extends Equatable {
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

  int getSubtotal() {
    if (cart.isEmpty) return 0;
    return cart
        .map((e) => e.productPrice.amount * e.quantity)
        .reduce((value, element) => value + element);
  }

  double getCalculateTotal() {
    if (cart.isEmpty) return 0;

    return cart
            .map((e) => e.productPrice.amount * e.quantity)
            .reduce((value, element) => value + element) +
        1.32 +
        2.83;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [cart, status];
}
