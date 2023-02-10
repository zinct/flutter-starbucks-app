import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:starbacks/features/cart/domain/entities/cart.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';
import 'package:starbacks/injection_container.dart';

abstract class CartLocalDataSource {
  Future<void> getListCart();
  Future<void> createCart(
      Product product, ProductPrice productPrice, int quantity);
}

const String CART_KEY = 'carts';

class CartLocalDataSourceSharedPreference extends CartLocalDataSource {
  @override
  Future<void> getListCart() {
    // TODO: implement getListCart
    throw UnimplementedError();
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
        List<Cart> selectedCart =
            mappedCurrentCart.where((e) => e.product.id == product.id).toList();
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
}
