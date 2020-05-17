import 'package:app_restaurant_test/Lists.dart';
import 'package:flutter/material.dart';

class FoodSheet extends StatefulWidget {
  FoodSheet({Key key, this.select}) : super(key: key);
  final String select;

  @override
  _FoodSheetState createState() => _FoodSheetState();
}

class _FoodSheetState extends State<FoodSheet> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Lists().getProdutos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return new Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
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
                              /* child: Image(
                                image: NetworkImage(image),
                                fit: BoxFit.cover,
                              ), */
                            ),
                          ),
                          Column(
                            children: <Widget>[],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
        });
  }
}
