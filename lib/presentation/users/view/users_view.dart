import 'package:admin_panel_unsilent/presentation/users/viewModel/users_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../app/config/app_config.dart';
import '../../common/staterenderer/state_renderer_impl.dart';
import '../../dashboard/components/recent_files.dart';
import '../../resources/constants_manager.dart';
import '../compenents/header_users_screen.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  final UsersViewModel _viewModel=store<UsersViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind(){
    _viewModel.start();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
            child: StreamBuilder<FlowState>(
                stream: _viewModel.output,
                builder: (context, snapshot) {
                  return snapshot.data?.getScreenWidget(
                      context, () {}, _getContentWidget(context)) ??
                      _getContentWidget(context);
                }),

        )
    );
  }
  Widget _getContentWidget(BuildContext context){
    return  const SingleChildScrollView(
      primary: false,
      padding: EdgeInsets.all(defaultPadding),
      child: Column(children: [
        HeaderUsersView(),
        SizedBox(height: defaultPadding),
        RecentFiles(),
      ]),
    );
  }
}






