// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserFromJson(Map<String, dynamic> json) => UserEntity(
      json['id'] as String?,
      json['username'] as String?,
      json['email'] as String?,
      json['numOfNotifications'] as int?,
      json['followers'] as int?,
      json['following'] as int?,
      json['gender'] as String?,
      json['role'] as String?,
      json['token'] as String?,
    );

Map<String, dynamic> _$UserToJson(UserEntity instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'gender': instance.gender,
      'role': instance.role,
      'numOfNotifications': instance.numOfNotifications,
      'followers': instance.followers,
      'following': instance.following,
      'token': instance.token,
    };
