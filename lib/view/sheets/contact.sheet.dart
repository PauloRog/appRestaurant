import 'package:flutter/material.dart';

class ContactSheet extends StatefulWidget {
  @override
  _ContactSheetState createState() => _ContactSheetState();
}

class _ContactSheetState extends State<ContactSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            margin:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 100.0),
          ),
        ],
      ),
    );
  }
}
