import 'package:admin/screens/animais/animais_page.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
import '../../responsive.dart';

class AnimaisMain extends StatelessWidget {
   AnimaisMain({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: AnimaisPage(
                scaffoldKey: scaffoldKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
