// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      json['_id'] as String,
    )
      ..categoryName = json['categoryName'] as String?
      ..createdAt = json['createdAt'] as String?
      ..products = (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'categoryName': instance.categoryName,
      'createdAt': instance.createdAt,
      'products': instance.products,
    };
