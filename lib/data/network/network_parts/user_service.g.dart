// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _UserService implements UserService {
  _UserService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://localhost:9090';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserEntityResponse> create(
    String username,
    String gender,
    String email,
    String password,
    String role,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'username': username,
      'gender': gender,
      'email': email,
      'password': password,
      'role': role,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserEntityResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v1/user',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserEntityResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
