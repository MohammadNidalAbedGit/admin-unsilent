import 'dart:async';

import 'package:admin_panel_unsilent/app/config/app_config.dart';
import 'package:admin_panel_unsilent/presentation/common/base/base_viewmodel.dart';
import 'package:admin_panel_unsilent/presentation/common/freeze/freezed_data_classes.dart';
import 'package:admin_panel_unsilent/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keycloak/flutter_keycloak.dart';

import '../../../app/config/keycloak_config.dart';


class LoginViewModel extends  BaseViewModel with ChangeNotifier implements LoginViewModelInput,LoginViewModelOutput{

  LoginViewModel();
  FlutterKeycloak keycloak = store<FlutterKeycloak>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  final StreamController _passwordStreamController =
  StreamController<String>.broadcast();
  final StreamController _userNameStreamController =
  StreamController<String>.broadcast();
  final StreamController _allAreValidStreamController = StreamController<void>.broadcast();
  var loginObject=LoginObject("", "");

  @override
  void start() {}


  @override
  void dispose() {
    super.dispose();
    _userNameStreamController.close();
    _passwordStreamController.close();
    _allAreValidStreamController.close();
  }

  @override
  login(BuildContext context)async {
    try {
      startLoading();
      _errorMessage = 'Error occurred during login: message';
      print("loginObject.username ${loginObject.username}");
      print("loginObject.password ${loginObject.password}");
      dynamic response = await keycloak.login(Keycloak.getConfiguration(), loginObject.username, loginObject.password,scope: 'email profile');
      stopLoading();
    } catch (e) {
      stopLoading();
      _errorMessage = 'Error occurred during login: ${e}';
      showErrorSnackBar(_errorMessage!,context);
    }
  }

  void showErrorSnackBar(String message,BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,style: const TextStyle(color: ColorManager.white),),
        backgroundColor: Colors.red,
      ),
    );
    notifyListeners();
  }

  void startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    _isLoading = false;
    notifyListeners();
  }

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  // TODO: implement inputAreAllDataValid
  Sink get inputAreAllDataValid => _allAreValidStreamController.sink;

  @override
  // TODO: implement outAreAllInputsValid
  Stream<bool> get outAreAllInputsValid => _allAreValidStreamController.stream.map((_) => _isFieldsValid());

  @override
  // TODO: implement outIsPasswordValid
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map((username) => username.toString().isNotEmpty);

  @override
  // TODO: implement outIsUsernameValid
  Stream<bool> get outIsUsernameValid => _userNameStreamController.stream.map((username) => username.toString().isNotEmpty);

  bool _isFieldsValid() {
     return loginObject.username.isNotEmpty && loginObject.password.isNotEmpty;
  }

  @override
  void setPassword(String password) {
    inputPassword.add(password);
    loginObject=loginObject.copyWith(password: password);
    inputAreAllDataValid.add(null);
  }

  @override
  void setUsername(String username) {
    inputUserName.add(username);
    loginObject=loginObject.copyWith(username: username);
    inputAreAllDataValid.add(null);
  }





}


abstract class LoginViewModelInput{

  login(BuildContext context);

  Sink get inputUserName;

  Sink get inputPassword;

  Sink get inputAreAllDataValid;

  void setUsername(String username);

  void setPassword(String password);

}

abstract class LoginViewModelOutput{

  Stream<bool> get outIsPasswordValid;

  Stream<bool> get outIsUsernameValid;

  Stream<bool> get outAreAllInputsValid;
}








