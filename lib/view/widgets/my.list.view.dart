import 'package:app_restaurant_test/view/widgets/product.tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/product.model.dart';

class MyListView extends StatelessWidget {
  MyListView({Key key, this.icons, this.filter}) : super(key: key);

  final Map icons;
  final String filter;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            List<DocumentSnapshot> documents = snapshot.data.documents;
            List<Product> products = List<Product>();
            documents.forEach(
              (element) {
                if (filter == 'Bebidas') {
                  Product p =
                      Product.fromJson(element.data, element.documentID);
                  if (p.category == 'drink') {
                    products.add(p);
                  }
                } else if (filter == 'Principais') {
                  Product p =
                      Product.fromJson(element.data, element.documentID);
                  if (p.category == 'food' && p.section == 'restaurant') {
                    products.add(p);
                  }
                } else if (filter == 'Porções') {
                  Product p =
                      Product.fromJson(element.data, element.documentID);
                  if (p.category == 'food' && p.section == 'pub') {
                    products.add(p);
                  }
                } else {
                  Product p =
                      Product.fromJson(element.data, element.documentID);
                  products.add(p);
                }
              },
            );

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductTile(
                  product: products[index],
                  icons: icons,
                );
              },
            );
        }
      },
    );
  }
}
