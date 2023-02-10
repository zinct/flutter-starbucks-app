import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';

part 'products_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductsModel extends Equatable {
  List<Product> data;

  ProductsModel(this.data);

  @override
  List<Object?> get props => [data];

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);
}
