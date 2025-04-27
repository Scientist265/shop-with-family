// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      addedBy: $enumDecode(_$AddedByEnumMap, json['addedBy']),
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'addedBy': _$AddedByEnumMap[instance.addedBy]!,
    };

const _$AddedByEnumMap = {
  AddedBy.host: 'host',
  AddedBy.friend: 'friend',
};
