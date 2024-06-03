import 'package:admin_panel_unsilent/presentation/resources/color_manager.dart';
import 'package:admin_panel_unsilent/presentation/resources/constants_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/string_manager.dart';
import '../../shardcompenents/text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          child: Row(
            children: [
              Expanded(
                  child: Container(
                color: ColorManager.secondaryColor,
              )),
              Expanded(
                  child: SingleChildScrollView(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Field(
                      hint: StringManager.enterUsername,
                      icon: const Icon(Icons.verified_user_outlined),
                      iconColor: ColorManager.greenAccent,
                      controller: _username,
                    ),
                    Field(
                      hint: StringManager.enterPassword,
                      icon: const Icon(Icons.verified_user_outlined),
                      iconColor: ColorManager.greenAccent,
                      controller: _password,
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
