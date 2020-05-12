import 'package:app_restaurant_test/models/products.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodSheet extends StatefulWidget {
  var foods = List<Products>();

  FoodSheet() {
    foods = [];
    foods.add(Products(title: "Título", description: "Descrição", price: 20));
    foods.add(Products(title: "Título", description: "Descrição", price: 20));
    foods.add(Products(title: "Título", description: "Descrição", price: 20));
    foods.add(Products(title: "Título", description: "Descrição", price: 20));
    foods.add(Products(title: "Título", description: "Descrição", price: 20));
    foods.add(Products(title: "Título", description: "Descrição", price: 20));
  }

  @override
  _FoodSheetState createState() => _FoodSheetState();
}

class _FoodSheetState extends State<FoodSheet> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.foods.length,
        itemBuilder: (BuildContext context, int index) {
          return StreamBuilder<DocumentSnapshot>(
              stream: Firestore.instance
                  .collection('standard')
                  .document('selectPage')
                  .snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    String image = snapshot.data['background'];
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      alignment: Alignment.center,
                      height: 100.0,
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  image: NetworkImage(image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: <Widget>[],
                            ),
                          ],
                        ),
                      ),
                    );
                }
              });
        });
  }
}
