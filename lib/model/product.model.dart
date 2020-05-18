import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String name;
  String image;
  String decription;
  String price;
  String category;
  String section;
  bool visible;

  Product(
      {this.id,
      this.name,
      this.image,
      this.decription,
      this.price,
      this.category,
      this.section,
      this.visible});

  Product.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    image = snapshot.data['image'];
    name = snapshot.data['title'];
    decription = snapshot.data['description'];
    price = snapshot.data['price'];
    category = snapshot.data['category'];
    section = snapshot.data['section'];
    visible = snapshot.data['visible'];
  }

  Product.fromJson(Map<String, dynamic> json, String idB) {
    this.id = idB;
    this.name = json['name'];
    this.image = json['image'];
    this.decription = json['decription'];
    this.price = json['price'];
    this.category = json['category'];
    this.section = json['section'];
    this.visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['decription'] = this.decription;
    data['price'] = this.price;
    data['category'] = this.category;
    data['section'] = this.section;
    data['visible'] = this.visible;
    return data;
  }
}
