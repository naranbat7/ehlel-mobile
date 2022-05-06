// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      json['_id'] as String,
    )
      ..title = json['title'] as String?
      ..features = json['features'] as String?
      ..createdAt = json['createdAt'] as String?
      ..priceUSD = (json['priceUSD'] as num?)?.toDouble()
      ..quantity = json['quantity'] as int?
      ..description = (json['description'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..photos =
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'features': instance.features,
      'createdAt': instance.createdAt,
      'priceUSD': instance.priceUSD,
      'quantity': instance.quantity,
      'description': instance.description,
      'photos': instance.photos,
    };
