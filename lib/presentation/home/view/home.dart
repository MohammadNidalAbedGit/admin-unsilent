import 'package:admin_panel_unsilent/app/controllers/navigation_page_controller.dart';
import 'package:admin_panel_unsilent/presentation/createuser/view/create_user_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/controllers/menu_app_controller.dart';
import '../../../responsive.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../../shardcompenents/side_menu.dart';
import '../../users/view/users_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Consumer<NavigationPageController>(
                builder: (context, provider, _) {
                  Widget selectedScreen=Container();
                  switch(provider.state.selectedScreen){
                    case Views.dashboard:
                      selectedScreen = const DashboardScreen();
                    case Views.users:
                      selectedScreen = const UsersView();
                    case Views.createUser:
                      selectedScreen = const CreateUserView();
                    default:
                      selectedScreen=Container();
                  }
                  return selectedScreen;
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}
