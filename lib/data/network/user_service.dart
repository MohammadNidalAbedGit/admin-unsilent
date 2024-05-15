import '../responses/user_entity_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../presentation/resources/constants_manager.dart';

part'network_parts/user_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class UserService{


  factory UserService(Dio dio,{String baseUrl}) = _UserService;

  @POST("/api/v1/user")
  Future<UserEntityResponse> create(
      @Field("username") String username,
      @Field("gender") String gender,
      @Field("email") String email,
      @Field("password") String password,
      @Field("role") String role,
      );


}