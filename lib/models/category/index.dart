import 'package:ehlel/models/product/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: '_id')
  String id;
  String? categoryName, createdAt;
  List<ProductModel>? products;

  CategoryModel(this.id);

  static List<CategoryModel> fromList(List<dynamic> data) => data.map((e) => CategoryModel.fromJson(e)).toList();

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
