import 'package:mobx/mobx.dart';
part 'drop.down.store.g.dart';

class DropDownStore = _DropDownStoreBase with _$DropDownStore;

abstract class _DropDownStoreBase with Store {
  @observable
  String select = 'OPCOES';

  @action
  void selectOption(String item) {
    select = item;
  }
}