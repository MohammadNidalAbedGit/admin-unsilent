import 'package:admin_panel_unsilent/app/controllers/navigation_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../resources/assets_manager.dart';
import '../resources/string_manager.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationPageController>(context);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(AssetsManager.logo),
          ),
          DrawerListTile(
            title: StringManager.dashboard,
            svgSrc: AssetsManager.menuDashboard,
            press: () {
              provider.navigateTo(Views.dashboard);
              // Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title:StringManager.users,
            svgSrc: AssetsManager.menuUsers,
            press: () {
              provider.navigateTo(Views.users);
              // Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: StringManager.transaction,
            svgSrc:  AssetsManager.menuTransaction,
            press: () {},
          ),
          DrawerListTile(
            title: StringManager.task,
            svgSrc: AssetsManager.menuTask,
            press: () {},
          ),
          DrawerListTile(
            title: StringManager.documents,
            svgSrc: AssetsManager.menuDoc,
            press: () {},
          ),
          DrawerListTile(
            title: StringManager.store,
            svgSrc: AssetsManager.menuStore,
            press: () {},
          ),
          DrawerListTile(
            title: StringManager.notification,
            svgSrc: AssetsManager.menuNotification,
            press: () {},
          ),
          DrawerListTile(
            title: StringManager.profile,
            svgSrc: AssetsManager.menuProfile,
            press: () {},
          ),
          DrawerListTile(
            title: StringManager.settings,
            svgSrc: AssetsManager.menuSettings,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
