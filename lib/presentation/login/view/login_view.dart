import 'package:admin_panel_unsilent/presentation/common/staterenderer/state_renderer_impl.dart';
import 'package:admin_panel_unsilent/presentation/login/viewmodel/login_view_model.dart';
import 'package:admin_panel_unsilent/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../../app/config/app_config.dart';
import '../../resources/string_manager.dart';
import '../../shardcompenents/text_field.dart';
import '../component/cutom_image.dart';
import '../component/text_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = store<LoginViewModel>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  _bind() {
    _viewModel.start();
    _passwordController.addListener(() {
      _viewModel.setPassword(_passwordController.text);
    });
    _userNameController.addListener(() {
      _viewModel.setUsername(_userNameController.text);
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 40, 42, 57),
        body: SafeArea(
          child: StreamBuilder<FlowState>(
              stream: _viewModel.output,
              builder: (context, snapshot) {
                return snapshot.data?.getScreenWidget(
                        context, () {}, _getContentWidget(context, provider)) ??
                    _getContentWidget(context, provider);
              }),
        ),
      );
    });
  }

  Widget _getContentWidget(BuildContext context, LoginViewModel provider) {
    return Row(
      children: [
        Form(
          key: _formKey,
          child: Expanded(
              child: Container(
            color: const Color.fromARGB(255, 40, 42, 57),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(50),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Login to your account',
                          textcolor: Colors.white,
                          textsize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Field(
                      hint: StringManager.enterUsername,
                      icon: const Icon(Icons.verified_user_outlined),
                      iconColor: ColorManager.greenAccent,
                      controller: _userNameController,
                      bgColor: const Color(0xff424253),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Field(
                      hint: StringManager.enterPassword,
                      icon: const Icon(Icons.verified_user_outlined),
                      iconColor: ColorManager.red,
                      controller: _passwordController,
                      bgColor: const Color(0xff424253),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder(
                      stream: _viewModel.outAreAllInputsValid,
                      builder: (context, snapshot) {
                        return GestureDetector(
                          onTap: (snapshot.data ?? false)
                              ? () async {
                                  await provider.login(context);
                                }
                              : null,
                          child: Container(
                              width: 250,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: snapshot.data == true
                                      ? ColorManager.electricBlue
                                      : ColorManager.whiteGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: provider.isLoading
                                      ? LoadingAnimationWidget.waveDots(
                                          color: Colors.white,
                                          size: 70,
                                        )
                                      : const Text(
                                          "Sign In",
                                          style: TextStyle(
                                              color: ColorManager.white,
                                              fontSize: 20),
                                        ))),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )),
        ),
        const CustomImageWidget(
          height: 1,
          width: 0.5,
          imgpath: 'assets/images/bg-login.png',
        ),
      ],
    );
  }
}
