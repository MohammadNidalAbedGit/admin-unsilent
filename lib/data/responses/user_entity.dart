import 'package:json_annotation/json_annotation.dart';
part 'response_parts/user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  @JsonKey(name:"id")
  String? id;
  @JsonKey(name:"username")
  String? username;
  @JsonKey(name:"email")
  String? email;
  @JsonKey(name:"gender")
  String? gender;
  @JsonKey(name:"role")
  String? role;
  @JsonKey(name:"numOfNotifications")
  int? numOfNotifications;
  @JsonKey(name:"followers")
  int? followers;
  @JsonKey(name:"following")
  int? following;
  @JsonKey(name:"token")
  String? token;

  UserEntity(this.id,this.username,this.email,this.numOfNotifications,this.followers,this.following,this.gender,this.role,this.token);

  factory UserEntity.fromJson(Map<String, dynamic> json) =>_$UserFromJson(json);

  Map<String, dynamic> toJson()=>_$UserToJson(this);
}