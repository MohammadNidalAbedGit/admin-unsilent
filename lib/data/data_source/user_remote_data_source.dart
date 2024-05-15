
import 'package:admin_panel_unsilent/data/network/user_service.dart';
import 'package:admin_panel_unsilent/data/requests/create_user_request.dart';
import 'package:admin_panel_unsilent/data/responses/user_entity_response.dart';

abstract class UserRemoteDataSource{

  Future<UserEntityResponse> create(CreateUserRequest request);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource{

   final UserService userService;

   UserRemoteDataSourceImpl(this.userService);


  @override
  Future<UserEntityResponse> create(CreateUserRequest request)async {
    return await userService.create(request.username!, request.gender!, request.email!, request.password!, request.role!);
  }

}

