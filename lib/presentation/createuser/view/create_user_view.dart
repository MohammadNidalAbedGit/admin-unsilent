import 'package:admin_panel_unsilent/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/config/app_config.dart';
import '../../../app/controllers/menu_app_controller.dart';
import '../../../app/controllers/navigation_page_controller.dart';
import '../../../responsive.dart';
import '../../common/staterenderer/state_renderer_impl.dart';
import '../../resources/color_manager.dart';
import '../../resources/constants_manager.dart';
import '../viewmodel/create_user_view_model.dart';

class CreateUserView extends StatefulWidget {
  const CreateUserView({Key? key}) : super(key: key);

  @override
  State<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {
  final CreateUserViewModel _viewModel = store<CreateUserViewModel>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  _bind() {
    _viewModel.start();
    _emailController.addListener(() {
      _viewModel.setEmail(_emailController.text);
    });
    _passwordController.addListener(() {
      _viewModel.setPassword(_passwordController.text);
    });
    _userNameController.addListener(() {
      _viewModel.setUsername(_userNameController.text);
    });
    _roleController.addListener(() {
      _viewModel.setRole(_roleController.text);
    });
    _genderController.addListener(() {
      _viewModel.setGender(_genderController.text);
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
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<FlowState>(
            stream: _viewModel.output,
            builder: (context, snapshot) {
              return snapshot.data?.getScreenWidget(
                  context, () {}, _getContentWidget(context)) ??
                  _getContentWidget(context);
            }),
      ),
    );

  }

  Widget _getContentWidget(BuildContext context) {
    final provider = Provider.of<NavigationPageController>(context);
    return  Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                if (!Responsive.isDesktop(context))
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: context.read<MenuAppController>().controlMenu,
                  )else
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed:(){provider.navigateTo(Views.users);}
                  ),
                Text(
                  StringManager.newUser,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<bool>(
                stream: _viewModel.outIsEmailValid,
                builder: (context, snapshot) {
                  return  Expanded(
                      child: Field(
                        hint: StringManager.enterEmail,
                        icon: const Icon(Icons.email_outlined),
                        iconColor: ColorManager.cottonCandyPink,
                        controller: _emailController,
                      ));
                },
              ),
              StreamBuilder<bool>(
                stream: _viewModel.outIsPasswordValid,
                builder: (context, snapshot) {
                  return  Expanded(
                      child: Field(
                        hint:  StringManager.enterPassword,
                        icon: const Icon(Icons.lock_outline),
                        iconColor: ColorManager.red,
                        controller: _passwordController,
                      ));
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<bool>(
                stream: _viewModel.outIsGenderValid,
                builder: (context, snapshot) {
                  return  Expanded(
                      child: Field(
                        hint: StringManager.enterGender,
                        icon: const Icon(Icons.person_outline),
                        iconColor: ColorManager.vibrantOrange,
                        controller: _genderController,
                      ));
                },
              ),
              StreamBuilder<bool>(
                stream: _viewModel.outIsRoleValid,
                builder: (context, snapshot) {
                  return Expanded(
                      child: Field(
                        hint: StringManager.enterRole,
                        icon: const Icon(Icons.list),
                        iconColor: ColorManager.electricBlue,
                        controller: _roleController,
                      ));
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<bool>(
                stream: _viewModel.outIsUsernameValid,
                builder: (context, snapshot) {
                  return Expanded(
                      child: Field(
                        hint: StringManager.enterUsername,
                        icon: const Icon(Icons.verified_user_outlined),
                        iconColor: ColorManager.greenAccent,
                        controller: _userNameController,
                      ));
                },
              ),
              Expanded(child: Container())
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                  stream: _viewModel.outAreAllInputsValid,
                  builder: (context, snapshot) {
                    return GestureDetector(
                        onTap: (snapshot.data ?? false)
                            ? () {
                          _viewModel.create();
                        }
                            :null,
                        child:  Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 30),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 30),
                            decoration: BoxDecoration(
                              color: snapshot.data!=true?ColorManager.white70: ColorManager.electricBlue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                             StringManager.create,
                              style: Theme.of(context).textTheme.titleMedium,
                            ))
                    );
                  }),

            ],
          ),
        ],
      ),
    );
  }
}

class Field extends StatelessWidget {
  final String hint;
  final Color iconColor;
  final Icon icon;
  final TextEditingController controller;

  const Field(
      {Key? key,
      required this.hint,
      required this.iconColor,
      required this.icon, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          fillColor: ColorManager.secondaryColor,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          prefixIcon: InkWell(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.6),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: icon),
          ),
        ),
      ),
    );
  }
}
