import 'package:app_restaurant_test/model/product.model.dart';
import 'package:app_restaurant_test/view/widgets/product.tile.user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodSheet extends StatefulWidget {
  FoodSheet({Key key, this.select}) : super(key: key);
  final String select;

  @override
  _FoodSheetState createState() => _FoodSheetState();
}

class _FoodSheetState extends State<FoodSheet> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection('produtos')
            .document('foods')
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
                      Product.fromDocument(snapshot.data.documents[index]));
                });
        });
  }
}
