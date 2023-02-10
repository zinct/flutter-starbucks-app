import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';

part 'cart.g.dart';

@JsonSerializable(explicitToJson: true)
class Cart extends Equatable {
  final Product product;
  final ProductPrice productPrice;
  int quantity;

  Cart({
    required this.product,
    required this.productPrice,
    required this.quantity,
  });

  @override
  List<Object?> get props => [];

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
