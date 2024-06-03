import 'package:admin_panel_unsilent/app/controllers/navigation_page_controller.dart';
import 'package:admin_panel_unsilent/presentation/home/view/home.dart';
import 'package:admin_panel_unsilent/presentation/login/view/login_view.dart';
import 'package:admin_panel_unsilent/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'app/config/app_config.dart';
import 'app/controllers/menu_app_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  await initCreateUserModule();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp._singleton();

  static const MyApp _instance = MyApp._singleton();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorManager.bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: ColorManager.secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
          ChangeNotifierProvider(
            create: (context) => NavigationPageController(),
          ),
        ],
        child:const Home(),
      ),
    );
  }
}
