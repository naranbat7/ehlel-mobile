// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel()
  ..id = json['_id'] as String?
  ..user = json['user'] as String?
  ..products = (json['products'] as List<dynamic>?)
      ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'products': instance.products?.map((e) => e.toJson()).toList(),
    };
