
import 'package:flutter/cupertino.dart';

class NavigationPageController extends ChangeNotifier{
  final AppSideMenuState _state =AppSideMenuState(Views.dashboard);
  AppSideMenuState get state=> _state;

  void navigateTo(String screen){
    _state.selectedScreen=screen;
    notifyListeners();
  }
}



class AppSideMenuState{
  String selectedScreen;
  AppSideMenuState(this.selectedScreen);
}

class Views{
  static const String dashboard="dashboard";
  static const String users="users";
  static const String createUser="create-user";
}

