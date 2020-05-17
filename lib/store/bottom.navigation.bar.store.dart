import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
part 'bottom.navigation.bar.store.g.dart';

class BottomStore = _BottomStoreBase with _$BottomStore;

abstract class _BottomStoreBase with Store {
  @observable
  int index = 0;

  @observable
  List<MyIcon> icons;

  @action
  void setIcons(String select) {
    getIcons(select).then((dado) {
      icons = dado.toList();
    });
  }

  Future<List<MyIcon>> getIcons(String select) async {
    List<MyIcon> _icons = List<MyIcon>();
    QuerySnapshot snapshot = await Firestore.instance
        .collection(select)
        .document('theme')
        .collection('appBar')
        .getDocuments();

    List<DocumentSnapshot> documents = snapshot.documents.toList();
    documents.forEach((f) {
      _icons.add(MyIcon.fromJson(f.data));
    });
    return _icons;
  }

  @action
  void setIndex(int value) => index = value;
}
