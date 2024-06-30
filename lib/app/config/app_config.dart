import 'package:admin_panel_unsilent/data/network/dio_factory.dart';
import 'package:admin_panel_unsilent/data/network/user_service.dart';
import 'package:admin_panel_unsilent/data/repository_impl/user_repository_impl.dart';
import 'package:admin_panel_unsilent/data/tools/network_info.dart';
import 'package:admin_panel_unsilent/domain/repository/user_repository.dart';
import 'package:admin_panel_unsilent/domain/usecase/create_user_usecase.dart';
import 'package:admin_panel_unsilent/presentation/login/viewmodel/login_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_keycloak/flutter_keycloak.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../data/data_source/user_remote_data_source.dart';
import '../../presentation/createuser/viewmodel/create_user_view_model.dart';
import '../../presentation/users/viewModel/users_viewmodel.dart';



final store= GetIt.instance;

Future<void> initAppModule()async {

  store.registerLazySingleton(() => FlutterKeycloak());
  store.registerLazySingleton(() => LoginViewModel());

  //Network Info __________________________

  store.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(InternetConnectionCheckerPlus()));

  //Dio Factory __________________________

  store.registerLazySingleton<DioFactory>(()=>DioFactory());

  //App Service Client __________________________

  Dio dio = store<DioFactory>().getDio();

  store.registerLazySingleton<UserService>(() =>UserService(dio) );

  //Remote Data Source __________________________

  store.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(store()));

  //Repository __________________________

  store.registerLazySingleton<UserRepository>(() =>UserRepositoryImp(store(),store()));

}

initCreateUserModule() {
  if(!GetIt.I.isRegistered<CreateUserUseCase>()){
    store.registerFactory<UsersViewModel>(() =>  UsersViewModel());
    store.registerFactory<CreateUserUseCase>(() => CreateUserUseCase(store()));
    store.registerFactory<CreateUserViewModel>(() =>CreateUserViewModel(store()));
  }

}