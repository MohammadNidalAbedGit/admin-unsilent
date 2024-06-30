
import 'package:flutter/cupertino.dart';

import '../../presentation/resources/routes_manager.dart';

class NavigationPageController extends ChangeNotifier{
  final AppSideMenuState _state =AppSideMenuState(Routes.dashboard);
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



