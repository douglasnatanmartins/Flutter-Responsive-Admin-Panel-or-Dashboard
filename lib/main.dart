

import 'package:admin/constants.dart';
import 'package:admin/controllers/base/base_controller.dart';
import 'package:admin/screens/animais/animais_main.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/propriedade/main_propriedade.dart';
import 'package:admin/screens/propriedade/propriedade_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controllers/menu_controller.dart';

Future<void> main() async {
  setupLocators();
  await initializeFirebase();
  runApp(MyApp());
}

void setupLocators() {
   GetIt.I.registerSingleton(BaseController());
   GetIt.I.registerSingleton(MenuController());
  // GetIt.I.registerSingleton(PropriedadeManager());
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp();
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/mainPropriedade':
            return MaterialPageRoute(
                builder: (BuildContext context) => MainPropriedade());
          case '/animaisMain':
            return MaterialPageRoute(
                builder: (BuildContext context) => AnimaisMain());
          case '/':
          default:
            return MaterialPageRoute(
                builder: (BuildContext context) => MainScreen());
        }
      },
    );
  }
}
