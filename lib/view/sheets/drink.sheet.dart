import 'package:flutter/material.dart';

class DrinkSheet extends StatefulWidget {
  DrinkSheet({Key key, this.select}) : super(key: key);
  final String select;
  @override
  _DrinkSheetState createState() => _DrinkSheetState();
}

class _DrinkSheetState extends State<DrinkSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
