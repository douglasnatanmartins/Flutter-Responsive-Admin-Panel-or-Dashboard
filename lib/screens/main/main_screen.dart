

import 'package:admin/controllers/menu_controller.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {

  final MenuController? menuController = GetIt.I<MenuController>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) =>
        Scaffold(
          key: scaffoldKey,
          drawer: SideMenu(),
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Queremos este menu lateral apenas para tela grande
                if (Responsive.isDesktop(context))
                  Expanded(
                    // padrão flex = 1
                    // e ocupa 1/6 parte da tela
                    child: SideMenu(),
                  ),
                Expanded(
                  // Ocupa 5/6 partes da tela
                  flex: 5,
                  child: DashboardScreen(
                    scaffoldKey: scaffoldKey,
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
