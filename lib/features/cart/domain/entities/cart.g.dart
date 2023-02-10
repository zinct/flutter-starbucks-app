// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      productPrice:
          ProductPrice.fromJson(json['productPrice'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'product': instance.product.toJson(),
      'productPrice': instance.productPrice.toJson(),
      'quantity': instance.quantity,
    };
