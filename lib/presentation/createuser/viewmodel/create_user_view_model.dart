import 'dart:async';

import 'package:admin_panel_unsilent/presentation/common/base/base_viewmodel.dart';
import 'package:admin_panel_unsilent/presentation/common/freeze/freezed_data_classes.dart';
import 'package:admin_panel_unsilent/presentation/common/staterenderer/state_renderer_impl.dart';

import '../../../domain/usecase/create_user_usecase.dart';
import '../../common/staterenderer/state_renderer.dart';

class CreateUserViewModel extends BaseViewModel
    implements CreateUserViewModelInput, CreateUserViewModelOutput {
  final CreateUserUseCase _createUserUseCase;

  CreateUserViewModel(this._createUserUseCase);

  final StreamController _emailStreamController =
      StreamController<String>();
  final StreamController _passwordStreamController =
      StreamController<String>();
  final StreamController _userNameStreamController =
      StreamController<String>();
  final StreamController _genderStreamController =
      StreamController<String>();
  final StreamController _roleStreamController =
      StreamController<String>();
  final StreamController _allAreValidStreamController =
      StreamController<void>();
  var createUserObject = CreateUserObject("", "", "", "", "");

  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
    _userNameStreamController.close();
    _roleStreamController.close();
    _genderStreamController.close();
    _passwordStreamController.close();
    _allAreValidStreamController.close();
  }

  @override
  void start()  {
    input.add(LoadingState(type: StateRendererType.fullLoadingScreenState));
  }

  @override
  create() async {
    input.add(LoadingState(type: StateRendererType.popupLoadingDialogState));
    (await _createUserUseCase.execute(CreateUserRequestUseCase(
            createUserObject.username,
            createUserObject.email,
            createUserObject.password,
            createUserObject.role,
            createUserObject.gender)))
        .fold(
            (failure) => {
                  input.add(ErrorState(
                      failure.message, StateRendererType.popupErrorDialogState))
                },
            (data) => {input.add(ContentState())});
  }

  @override
  // TODO: implement inputAreAllDataValid
  Sink get inputAreAllDataValid => _allAreValidStreamController.sink;

  @override
  // TODO: implement inputEmail
  Sink get inputEmail => _emailStreamController.sink;

  @override
  // TODO: implement inputGender
  Sink get inputGender => _genderStreamController.sink;

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  // TODO: implement inputRole
  Sink get inputRole => _roleStreamController.sink;

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  // TODO: implement outAreAllInputsValid
  Stream<bool> get outAreAllInputsValid => _allAreValidStreamController.stream.map((_) => _isFieldsValid());

  @override
  // TODO: implement outIsEmailValid
  Stream<bool> get outIsEmailValid  => _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  // TODO: implement outIsGenderValid
  Stream<bool> get outIsGenderValid => _genderStreamController.stream.map((gender) => gender.toString().isNotEmpty);

  @override
  // TODO: implement outIsPasswordValid
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  // TODO: implement outIsRoleValid
  Stream<bool> get outIsRoleValid => _roleStreamController.stream.map((role) => role.toString().isNotEmpty);

  @override
  // TODO: implement outIsUsernameValid
  Stream<bool> get outIsUsernameValid => _userNameStreamController.stream.map((username) => username.toString().isNotEmpty);



  @override
  setGender(String gender) {
    inputGender.add(gender);
    createUserObject=createUserObject.copyWith(gender:gender);
    inputAreAllDataValid.add(null);
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    createUserObject=createUserObject.copyWith(email:email);
    inputAreAllDataValid.add(null);  // must add anything for check is valid all data or not
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    createUserObject=createUserObject.copyWith(password:password);
    inputAreAllDataValid.add(null);
  }

  @override
  setRole(String role) {
    inputRole.add(role);
    createUserObject=createUserObject.copyWith(role:role);
    inputAreAllDataValid.add(null);
  }

  @override
  setUsername(String username) {
    inputUserName.add(username);
    createUserObject=createUserObject.copyWith(username:username);
    inputAreAllDataValid.add(null);
  }


  //_____________________________________________ helpers method

  bool _isFieldsValid(){
    return (_isEmailValid(createUserObject.email) && _isEmailValid(createUserObject.password)
    && createUserObject.gender.isNotEmpty&& createUserObject.role.isNotEmpty&& createUserObject.username.isNotEmpty);
  }

  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }

  bool _isEmailValid(String email){
    return email.isNotEmpty;
  }

}

abstract class CreateUserViewModelInput {
  setUsername(String username);

  setEmail(String email);

  setPassword(String password);

  setGender(String gender);

  setRole(String role);

  create();

  Sink get inputUserName;

  Sink get inputPassword;

  Sink get inputEmail;

  Sink get inputGender;

  Sink get inputRole;

  Sink get inputAreAllDataValid;
}

abstract class CreateUserViewModelOutput {
  Stream<bool> get outIsEmailValid;

  Stream<bool> get outIsPasswordValid;

  Stream<bool> get outIsUsernameValid;

  Stream<bool> get outIsRoleValid;

  Stream<bool> get outIsGenderValid;

  Stream<bool> get outAreAllInputsValid;
}
