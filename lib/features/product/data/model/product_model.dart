import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel extends Equatable {
  List<Product> products;

  ProductModel({required this.products});

  @override
  List<Object?> get props => [];

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
