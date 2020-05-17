import 'package:mobx/mobx.dart';
part 'drop.down.store.g.dart';

class DropDownStore = _DropDownStoreBase with _$DropDownStore;

abstract class _DropDownStoreBase with Store {
  @observable
  String select = 'Opções';

  @action
  void selectOption(String item) {
    select = item;
    print(select);
  }
}