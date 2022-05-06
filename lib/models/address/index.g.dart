// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel()
  ..id = json['_id'] as String?
  ..firstname = json['firstname'] as String?
  ..lastname = json['lastname'] as String?
  ..country = json['country'] as String?
  ..street = json['street'] as String?
  ..city = json['city'] as String?
  ..state = json['state'] as String?
  ..postcode = json['postcode'] as String?
  ..email = json['email'] as String?
  ..user = json['user'] as String?;

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'postcode': instance.postcode,
      'email': instance.email,
      'user': instance.user,
    };
