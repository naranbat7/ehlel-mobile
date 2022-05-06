import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class CartItemModel {
  @JsonKey(name: '_id')
  String? id;
  String? product;
  int? quantity;

  CartItemModel();

  static List<CartItemModel> fromList(List<dynamic> data) => data.map((e) => CartItemModel.fromJson(e)).toList();

  factory CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
