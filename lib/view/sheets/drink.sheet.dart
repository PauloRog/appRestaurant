import 'package:app_restaurant_test/models/products.dart';
import 'package:app_restaurant_test/tiles/product_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DrinkSheet extends StatefulWidget {
  DrinkSheet(this.select);

  final String select;
  @override
  _DrinkSheetState createState() => _DrinkSheetState();
}

class _DrinkSheetState extends State<DrinkSheet> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection('produtos')
            .document('drinks')
            .collection(widget.select)
            .getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView.builder(
                padding: EdgeInsets.all(4.0),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductTile(
                      Products.fromDocument(snapshot.data.documents[index]));
                });
        });
  }
}
