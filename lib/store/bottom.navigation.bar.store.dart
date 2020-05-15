import 'package:mobx/mobx.dart';
part 'bottom.navigation.bar.store.g.dart';

class BottomStore = _BottomStoreBase with _$BottomStore;

abstract class _BottomStoreBase with Store {

  @observable
  int index = 0;

  @action
  void setIndex(int value) => index = value;
}