import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel {
  @JsonKey(name: '_id')
  String id;
  String? title, features, createdAt;
  double? priceUSD;
  int? quantity;
  List<String>? description, photos;
  // CategoryModel? category;

  ProductModel(this.id);

  String get primaryImage => (photos ?? []).isNotEmpty ? photos!.first : '';
  String? get titleEllips => (title ?? '').length > 30 ? title!.substring(0, 30) + '...' : null;

  static List<ProductModel> fromList(List<dynamic> data) => data.map((e) => ProductModel.fromJson(e)).toList();

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
