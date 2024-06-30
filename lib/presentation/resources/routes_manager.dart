import 'package:admin_panel_unsilent/presentation/login/view/login_view.dart';
import 'package:flutter/material.dart';


class Routes{
  static const String dashboard="/dashboard";
  static const String users="/users";
  static const String createUser="/create-user";
  static const String login="/login";
}


class RouteGenerator{

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_)=> const LoginView());
      default:
        return unDefinedRoute();
    }
  }


  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text("not found page"),
          ),
          body: const Center(child: Text("not found page")),
        ));
  }

}