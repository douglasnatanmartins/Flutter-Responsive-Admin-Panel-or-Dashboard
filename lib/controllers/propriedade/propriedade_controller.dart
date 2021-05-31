import 'package:admin/Repository/Propriedade_Repository/propriedade_repository.dart';
import 'package:admin/models/propriedade_model/propriedade_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'propriedade_controller.g.dart';

class PorpriedadeController = _PorpriedadeController with _$PorpriedadeController;

abstract class _PorpriedadeController with Store {


  ObservableList<PropriedadeModel> listPropriedades =
  ObservableList<PropriedadeModel>();

  @observable
  BuildContext? context;

  @observable
  int qtdPropriedades = 0;

  @observable
  String? erro;

  @action
  void setBuilContext(BuildContext value) => context = value;

  @action
  void setQtdPropriedades(int value) => qtdPropriedades = value;

  @action
  Future<void> listPro() async {
    try {
      listPropriedades.clear();
      final result = await PropriedadeRepository()
          .getPropriedade('0841HpnSHehwbXfH8RKyRJKZm662', context!);
      listPropriedades.addAll(result);
      setQtdPropriedades(result.length);
    } catch (e) {
      erro = e.toString();
      return Future.error(e);
    }
  }
}