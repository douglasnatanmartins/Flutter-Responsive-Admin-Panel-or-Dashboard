

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'menu_controller.g.dart';

class MenuController = _MenuController with _$MenuController;

abstract class _MenuController with Store {

  @action
  void controlMenu(GlobalKey<ScaffoldState> scaffoldKey) {
    if (!scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

}