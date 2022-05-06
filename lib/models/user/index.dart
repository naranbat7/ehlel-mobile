import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: '_id')
  String id;
  String? email, firstname, lastname, phone;
  double? point;

  UserModel(this.id);

  static List<UserModel> fromList(List<dynamic> data) => data.map((e) => UserModel.fromJson(e)).toList();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
