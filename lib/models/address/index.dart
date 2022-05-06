import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class AddressModel {
  @JsonKey(name: '_id')
  String? id;
  String? firstname, lastname, country, street, city, state, postcode, email, user;

  AddressModel();

  static List<AddressModel> fromList(List<dynamic> data) => data.map((e) => AddressModel.fromJson(e)).toList();

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
