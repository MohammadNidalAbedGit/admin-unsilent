import 'package:admin_panel_unsilent/data/mapper/user_mapper.dart';
import 'package:admin_panel_unsilent/data/model/failure.dart';
import 'package:admin_panel_unsilent/data/requests/create_user_request.dart';
import 'package:admin_panel_unsilent/data/responses/user_entity_response.dart';
import 'package:admin_panel_unsilent/data/tools/error_handler.dart';
import 'package:admin_panel_unsilent/data/tools/network_info.dart';
import 'package:admin_panel_unsilent/domain/domain/user_response.dart';
import 'package:admin_panel_unsilent/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../data_source/user_remote_data_source.dart';

class UserRepositoryImp implements UserRepository{


  final UserRemoteDataSource dataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImp(this.dataSource,this.networkInfo);

  @override
  Future<Either<Failure, UserResponse>> create(CreateUserRequest request) async{
    if(await networkInfo.isConnected){
      try{
        UserEntityResponse response = await dataSource.create(request);
        if(response.status==ApiInternalStatus.success){
          return Right(response.toMapper());
        }else{
          return Left(Failure(02,response.errors!['message']!));
        }
      }catch(error){
        return Left(ErrorHandler.handler(error).failure);
      }
    
    }else{
     return Left(Failure(01,"network fail , try again"));
    }
  }

}