import 'package:admin_panel_unsilent/data/model/failure.dart';
import 'package:admin_panel_unsilent/domain/domain/user_response.dart';
import 'package:admin_panel_unsilent/domain/repository/user_repository.dart';
import 'package:admin_panel_unsilent/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../data/requests/create_user_request.dart';


class CreateUserUseCase implements BaseUseCase<CreateUserRequestUseCase,UserResponse>{

  UserRepository userRepository;

  CreateUserUseCase(this.userRepository);

  @override
  Future<Either<Failure, UserResponse>> execute(CreateUserRequestUseCase request) async{
    return await userRepository.create(CreateUserRequest(request.username,request.email,request.password,request.role,request.gender));
  }

}

class CreateUserRequestUseCase{
  String username;
  String gender;
  String email;
  String password;
  String role;

  CreateUserRequestUseCase(this.username,this.email,this.password,this.role,this.gender);
}


