import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.model.dart';

class ProductsController {
  Future<void> delete(String id) async {
    try {
      await Firestore.instance.collection('products').document(id).delete();
    } catch (err) {
      print(err);
    }
  }

  Future<void> update(Product product) async {
    try {
      await Firestore.instance
          .collection('products')
          .document(product.id)
          .setData(
            product.toJson(),
          );
    } catch (err) {
      print(err);
    }
  }
}
