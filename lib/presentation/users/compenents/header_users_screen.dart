import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/controllers/navigation_page_controller.dart';
import '../../../app/controllers/menu_app_controller.dart';
import '../../../responsive.dart';
import '../../resources/color_manager.dart';
import '../../resources/string_manager.dart';

class HeaderUsersView extends StatelessWidget {
  const HeaderUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationPageController>(context);
    return  Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            StringManager.users,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        GestureDetector(
          onTap: (){
            provider.navigateTo(Views.createUser);
          },
          child: Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 30),
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 30),
              decoration: BoxDecoration(
                color: ColorManager.electricBlue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Icon(Icons.add),
                  Text(
                    StringManager.addUser,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              )),
        )

      ],
    );
  }
}



