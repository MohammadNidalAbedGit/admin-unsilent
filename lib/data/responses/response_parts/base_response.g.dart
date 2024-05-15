// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as String?
  ..message = json['message'] as String?
  ..errors = (json['errors'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };
