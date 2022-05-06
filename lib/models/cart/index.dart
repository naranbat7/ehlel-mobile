import 'package:ehlel/models/cart_item/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable(explicitToJson: true)
class CartModel {
  @JsonKey(name: '_id')
  String? id;
  String? user;
  List<CartItemModel>? products;

  CartModel();

  static List<CartModel> fromList(List<dynamic> data) => data.map((e) => CartModel.fromJson(e)).toList();

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
