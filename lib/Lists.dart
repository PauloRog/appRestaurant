import 'package:cloud_firestore/cloud_firestore.dart';

class Lists {
  Lists();

  Future getProdutos() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('produtos').getDocuments();
    return qn.documents;
  }
}
