import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:starbacks/core/errors/failure.dart';
import 'package:starbacks/features/cart/domain/entities/cart.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';
import 'package:starbacks/injection_container.dart';

abstract class CartLocalDataSource {
  Future<List<Cart>> getListCart();
  Future<void> createCart(
      Product product, ProductPrice productPrice, int quantity);
  Future<List<Cart>> changeQuantity(Cart cart, int quantity);
  Future<void> emptyCart();
  Future<void> removeCart(Cart cart);
}

const String CART_KEY = 'carts';

class CartLocalDataSourceSharedPreference extends CartLocalDataSource {
  @override
  Future<List<Cart>> getListCart() async {
    try {
      final prefs = await getIt.getAsync<SharedPreferences>();

      // Get Currenct Cart
      final cartData = prefs.getString(CART_KEY);
      if (cartData == null) {
        return [];
      } else {
        var rawCurrentCart = jsonDecode(cartData);
        return (rawCurrentCart as List).map((e) => Cart.fromJson(e)).toList();
      }
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> createCart(
    Product product,
    ProductPrice productPrice,
    int quantity,
  ) async {
    try {
      List data;
      final prefs = await getIt.getAsync<SharedPreferences>();

      // Get Currenct Cart
      final cartData = prefs.getString(CART_KEY);

      if (cartData == null) {
        await prefs.setString(
          CART_KEY,
          jsonEncode([
            Cart(
              product: product,
              productPrice: productPrice,
              quantity: quantity,
            )
          ]),
        );
      } else {
        var rawCurrentCart = jsonDecode(cartData);
        List<Cart> mappedCurrentCart =
            (rawCurrentCart as List).map((e) => Cart.fromJson(e)).toList();

        // Check if product already exists
        List<Cart> selectedCart = mappedCurrentCart
            .where((e) =>
                e.product.id == product.id && e.productPrice == productPrice)
            .toList();
        // Add New Cart if product doesnt exists
        if (selectedCart.isEmpty) {
          mappedCurrentCart.add(Cart(
            product: product,
            productPrice: productPrice,
            quantity: quantity,
          ));
        }
        // Add Quantity if Item already exists
        else {
          for (var e in mappedCurrentCart) {
            if (e.product == product) {
              e.quantity++;
              break;
            }
          }
        }

        await prefs.setString(CART_KEY, jsonEncode(mappedCurrentCart));
      }
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<List<Cart>> changeQuantity(Cart cart, int quantity) async {
    try {
      final prefs = await getIt.getAsync<SharedPreferences>();

      // Get Current Cart
      final cartData = prefs.getString(CART_KEY);

      if (cartData == null)
        throw CartFailure(
            cart, 'Cart item not found for changing it quantity.');

      var rawCurrentCart = jsonDecode(cartData);

      List<Cart> mappedCurrentCart =
          (rawCurrentCart as List).map((e) => Cart.fromJson(e)).toList();

      for (var e in mappedCurrentCart) {
        if (e == cart) {
          e.quantity = quantity;
          break;
        }
      }

      await prefs.setString(CART_KEY, jsonEncode(mappedCurrentCart));
      return mappedCurrentCart;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> emptyCart() async {
    final prefs = await getIt.getAsync<SharedPreferences>();
    prefs.remove(CART_KEY);
  }

  @override
  Future<void> removeCart(Cart cart) async {
    try {
      final prefs = await getIt.getAsync<SharedPreferences>();
      // Get Current Cart
      final cartData = prefs.getString(CART_KEY);

      if (cartData == null) throw CartFailure(cart, 'Cart item not found.');

      var rawCurrentCart = jsonDecode(cartData);

      List<Cart> mappedCurrentCart =
          (rawCurrentCart as List).map((e) => Cart.fromJson(e)).toList();

      var tes = mappedCurrentCart.remove(cart);
      await prefs.setString(CART_KEY, jsonEncode(mappedCurrentCart));
    } catch (err) {
      rethrow;
    }
  }
}
