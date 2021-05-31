import 'package:mobx/mobx.dart';
part 'base_controller.g.dart';

class BaseController = _BaseController with _$BaseController;

abstract class _BaseController with Store {

  @observable
  int page = 0;

  @action
  void setPage(int value) => page = value;

}