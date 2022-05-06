// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel()
      ..id = json['_id'] as String?
      ..product = json['product'] as String?
      ..quantity = json['quantity'] as int?;

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'product': instance.product,
      'quantity': instance.quantity,
    };
