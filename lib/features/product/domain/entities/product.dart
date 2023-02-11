import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product extends Equatable {
  final String id, name, description, image, category;
  final List<ProductPrice> prices;

  const Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.category,
      required this.prices});

  @override
  List<Object?> get props => [id, name, description, image, prices, category];

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductPrice extends Equatable {
  final String name;
  final int amount;

  const ProductPrice({required this.name, required this.amount});

  @override
  List<Object?> get props => [name, amount];

  factory ProductPrice.fromJson(Map<String, dynamic> json) =>
      _$ProductPriceFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPriceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductCategory extends Equatable {
  final String id, name;

  const ProductCategory({required this.id, required this.name});

  @override
  List<Object?> get props => [name];

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}
