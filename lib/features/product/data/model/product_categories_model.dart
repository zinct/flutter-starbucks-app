import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';

part 'product_categories_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductCategoriesModel extends Equatable {
  List<ProductCategory> data;

  ProductCategoriesModel(this.data);

  @override
  List<Object?> get props => [data];

  factory ProductCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoriesModelFromJson(json);
}
