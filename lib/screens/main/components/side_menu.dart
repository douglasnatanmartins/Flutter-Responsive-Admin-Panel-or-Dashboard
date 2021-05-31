import 'package:admin/constants.dart';
import 'package:admin/controllers/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

class SideMenu extends StatelessWidget {
   SideMenu({Key? key}) : super(key: key);

  final BaseController baseController = GetIt.I<BaseController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            Observer(builder: (_) =>
                DrawerListTile(
                  title: 'Dashbord',
                  iconData: FontAwesomeIcons.chartLine,
                  press: () {
                    baseController.setPage(0);
                    Navigator.of(context).pushNamed('/');
                  },
                  isSelect: baseController.page == 0,
                )),
           Observer(builder: (_) =>
               DrawerListTile(
                 title: 'Propriedade',
                 iconData: FontAwesomeIcons.mapSigns,
                 press: () {
                   baseController.setPage(1);
                   Navigator.pushNamed(context, '/mainPropriedade');
                 }, isSelect: baseController.page == 1,

               )),
            Observer(builder: (_) =>
                DrawerListTile(
                  title: 'Animais',
                  iconData: FontAwesomeIcons.clipboardList,
                  press: () {
                    baseController.setPage(2);
                    Navigator.of(context).pushNamed('/animaisMain');
                  },
                  isSelect: baseController.page == 2,
                )
            ),
            Observer(builder: (_) =>
                DrawerListTile(
                  title: 'Manejo',
                  iconData: FontAwesomeIcons.exchangeAlt,
                  press: () {
                    baseController.setPage(3);
                  },
                  isSelect: baseController.page == 3,
                )),
            Observer(builder: (_) =>
                DrawerListTile(
                  title: 'Serviços',
                  iconData: FontAwesomeIcons.wrench,
                  press: () {
                    baseController.setPage(4);
                  },
                  isSelect: baseController.page == 4,
                )),
            /*DrawerListTile(
              title: "Notification",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Profile",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Settings",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {},
            ),*/
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.iconData,
    required this.press,
    required this.isSelect,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final VoidCallback press;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        iconData,
        color: isSelect ? primaryColor : Colors.white54,
        size: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: isSelect ? primaryColor : Colors.white54),
      ),
    );
  }
}
