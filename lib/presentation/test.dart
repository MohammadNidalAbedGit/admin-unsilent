// import 'package:admin_panel_unsilent/presentation/resources/color_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:provider/provider.dart';
//
// import '../app/config/app_config.dart';
// import '../app/controllers/loading_login_controller.dart';
// import 'common/staterenderer/state_renderer_impl.dart';
// import 'login/viewmodel/login_view_model.dart';
//
// class TestView extends StatefulWidget {
//   const TestView({Key? key}) : super(key: key);
//
//   @override
//   State<TestView> createState() => _TestViewState();
// }
//
// class _TestViewState extends State<TestView> {
//
//   final LoginViewModel _viewModel = store<LoginViewModel>();
//
//
//   @override
//   void initState() {
//     _bind();
//     super.initState();
//   }
//
//   _bind() {
//     _viewModel.start();
//   }
//
//   @override
//   void dispose() {
//     _viewModel.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 40, 42, 57),
//       body: SafeArea(
//         child: StreamBuilder<FlowState>(
//             stream: _viewModel.output,
//             builder: (context, snapshot) {
//               return snapshot.data?.getScreenWidget(
//                   context, () {}, _getContentWidget(context)) ??
//                   _getContentWidget(context);
//             }),
//       ),
//     );
//   }
//
//   Widget _getContentWidget(BuildContext context){
//     final provider = Provider.of<LoadingLoginController>(context);
//     return  Center(
//       child: StreamBuilder(
//         stream: _viewModel.outAreAllInputsValid,
//         builder: (context, snapshot) {
//           return GestureDetector(
//             onTap: (true)
//                 ? ()async {
//               provider.startLoading();
//               await _viewModel.login();
//               provider.stopLoading();
//             }
//                 : null,
//             child: Container(
//                 width: 250,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     color: snapshot.data == true
//                         ? ColorManager.electricBlue
//                         : ColorManager.whiteGrey,
//                     borderRadius: BorderRadius.circular(5)),
//                 child: Center(child:
//                 Consumer<LoadingLoginController>(
//                     builder: (context, listen, _) {
//                       return listen.isLoading
//                           ? LoadingAnimationWidget.waveDots(
//                         color: Colors.white,
//                         size: 70,
//                       )
//                           : const Text(
//                         "Sign In",
//                         style: TextStyle(
//                             color: ColorManager.white,
//                             fontSize: 20),
//                       );
//                     }))),
//           );
//         },
//       )
//     );
//   }
// }
//
//
