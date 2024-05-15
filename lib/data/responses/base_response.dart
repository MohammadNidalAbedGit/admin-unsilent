
import 'package:json_annotation/json_annotation.dart';
part 'response_parts/base_response.g.dart';

@JsonSerializable()
class BaseResponse{

  @JsonKey(name:"status")
  String? status;

  @JsonKey(name:"message")
  String? message;

  @JsonKey(name:"errors")
  Map<String, String>? errors;

}






