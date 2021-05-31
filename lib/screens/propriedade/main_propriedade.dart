import 'package:admin/screens/main/components/side_menu.dart';
import 'package:admin/screens/propriedade/propriedade_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../responsive.dart';

// ignore: must_be_immutable
class MainPropriedade extends StatelessWidget {
   MainPropriedade({Key? key}) : super(key: key);

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
                  child: PropriedadePage(
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
