// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoriesModel _$ProductCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    ProductCategoriesModel(
      (json['data'] as List<dynamic>)
          .map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductCategoriesModelToJson(
        ProductCategoriesModel instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
