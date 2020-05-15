import 'package:app_restaurant_test/models/products.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Products product;

  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        product.title,
                        style: TextStyle(
                          fontFamily: "Capriola",
                          fontSize: 18.0,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        product.description,
                        style: TextStyle(
                          fontFamily: "Capriola",
                          fontSize: 12.0,
                          color: Color.fromRGBO(133, 163, 159, 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "R\$ ${product.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontFamily: "Capriola",
                          fontSize: 18.0,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
