import 'package:cloud_firestore/cloud_firestore.dart';

class Products {
  String id;
  String image;
  String title;
  String description;
  double price;
  bool isFood;
  bool isRestaurant;
  bool isPub;

  Products.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    image = snapshot.data['image'];
    title = snapshot.data['title'];
    description = snapshot.data['description'];
    price = snapshot.data['price'] + 0.0;
    isFood = snapshot.data['isFood'];
    isRestaurant = snapshot.data['isRestaurant'];
    isPub = snapshot.data['isPub'];
  }
}
