// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_entity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntityResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserEntityResponse(
      json['data'] == null
          ? null
          : UserEntity.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errors = (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      );

Map<String, dynamic> _$UserResponseToJson(UserEntityResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'data': instance.user,
    };
