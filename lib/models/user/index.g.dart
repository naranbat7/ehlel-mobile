// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['_id'] as String,
    )
      ..email = json['email'] as String?
      ..firstname = json['firstname'] as String?
      ..lastname = json['lastname'] as String?
      ..phone = json['phone'] as String?
      ..point = (json['point'] as num?)?.toDouble();

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phone': instance.phone,
      'point': instance.point,
    };
