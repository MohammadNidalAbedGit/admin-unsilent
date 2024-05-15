

import 'package:admin_panel_unsilent/data/requests/create_user_request.dart';
import 'package:admin_panel_unsilent/domain/domain/user_response.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/failure.dart';

abstract class UserRepository {

  Future<Either<Failure,UserResponse>> create(CreateUserRequest request);
}