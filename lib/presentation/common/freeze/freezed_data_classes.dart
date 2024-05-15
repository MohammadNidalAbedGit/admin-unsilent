import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class CreateUserObject with _$CreateUserObject {
  factory CreateUserObject(String username, String email, String password,
      String role, String gender) = _CreateUserObject;
}
