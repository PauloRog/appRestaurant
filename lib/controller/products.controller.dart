import 'package:app_restaurant_test/model/product.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsController {
  Future<void> delete(String id) async {
    try {
      await Firestore.instance.collection('products').document(id).delete();
    } catch (err) {
      print(err);
    }
  }

  Future<void> add(Product product) async {
    Firestore.instance.collection('products').add(product.toJson());
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
