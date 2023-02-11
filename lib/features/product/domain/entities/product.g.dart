// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      category: json['category'] as String,
      prices: (json['prices'] as List<dynamic>)
          .map((e) => ProductPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'category': instance.category,
      'prices': instance.prices.map((e) => e.toJson()).toList(),
    };

ProductPrice _$ProductPriceFromJson(Map<String, dynamic> json) => ProductPrice(
      name: json['name'] as String,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$ProductPriceToJson(ProductPrice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
    };

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) =>
    ProductCategory(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProductCategoryToJson(ProductCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
