import 'package:admin_panel_unsilent/data/responses/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';
part 'response_parts/user_entity_response.g.dart';

@JsonSerializable()
class UserEntityResponse extends BaseResponse{

  @JsonKey(name:"data")
  UserEntity? user;

  UserEntityResponse(this.user);

  factory UserEntityResponse.fromJson(Map<String,dynamic> json)=>_$UserResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$UserResponseToJson(this);
}