// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
  'id': instance.id,
  'hostName': instance.hostName,
  'friendName': instance.friendName,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt.toIso8601String(),
};

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: json['id'] as String,
      hostName: json['hostName'] as String,
      friendName: json['friendName'] as String?,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hostName': instance.hostName,
      'friendName': instance.friendName,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
    };
