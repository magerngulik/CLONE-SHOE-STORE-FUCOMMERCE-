// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      productName: json['product_name'] as String?,
      photo: json['photo'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      seller: json['seller'] == null
          ? null
          : Seller.fromJson(json['seller'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'product_name': instance.productName,
      'photo': instance.photo,
      'price': instance.price,
      'description': instance.description,
      'seller': instance.seller,
    };
