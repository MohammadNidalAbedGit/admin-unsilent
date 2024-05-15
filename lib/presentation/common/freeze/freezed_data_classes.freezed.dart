// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateUserObject {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateUserObjectCopyWith<CreateUserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserObjectCopyWith<$Res> {
  factory $CreateUserObjectCopyWith(
          CreateUserObject value, $Res Function(CreateUserObject) then) =
      _$CreateUserObjectCopyWithImpl<$Res, CreateUserObject>;
  @useResult
  $Res call(
      {String username,
      String email,
      String password,
      String role,
      String gender});
}

/// @nodoc
class _$CreateUserObjectCopyWithImpl<$Res, $Val extends CreateUserObject>
    implements $CreateUserObjectCopyWith<$Res> {
  _$CreateUserObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? role = null,
    Object? gender = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateUserObjectImplCopyWith<$Res>
    implements $CreateUserObjectCopyWith<$Res> {
  factory _$$CreateUserObjectImplCopyWith(_$CreateUserObjectImpl value,
          $Res Function(_$CreateUserObjectImpl) then) =
      __$$CreateUserObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String email,
      String password,
      String role,
      String gender});
}

/// @nodoc
class __$$CreateUserObjectImplCopyWithImpl<$Res>
    extends _$CreateUserObjectCopyWithImpl<$Res, _$CreateUserObjectImpl>
    implements _$$CreateUserObjectImplCopyWith<$Res> {
  __$$CreateUserObjectImplCopyWithImpl(_$CreateUserObjectImpl _value,
      $Res Function(_$CreateUserObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? role = null,
    Object? gender = null,
  }) {
    return _then(_$CreateUserObjectImpl(
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateUserObjectImpl implements _CreateUserObject {
  _$CreateUserObjectImpl(
      this.username, this.email, this.password, this.role, this.gender);

  @override
  final String username;
  @override
  final String email;
  @override
  final String password;
  @override
  final String role;
  @override
  final String gender;

  @override
  String toString() {
    return 'CreateUserObject(username: $username, email: $email, password: $password, role: $role, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserObjectImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, username, email, password, role, gender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserObjectImplCopyWith<_$CreateUserObjectImpl> get copyWith =>
      __$$CreateUserObjectImplCopyWithImpl<_$CreateUserObjectImpl>(
          this, _$identity);
}

abstract class _CreateUserObject implements CreateUserObject {
  factory _CreateUserObject(
      final String username,
      final String email,
      final String password,
      final String role,
      final String gender) = _$CreateUserObjectImpl;

  @override
  String get username;
  @override
  String get email;
  @override
  String get password;
  @override
  String get role;
  @override
  String get gender;
  @override
  @JsonKey(ignore: true)
  _$$CreateUserObjectImplCopyWith<_$CreateUserObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
