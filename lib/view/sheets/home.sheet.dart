import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeSheet extends StatefulWidget {
  @override
  _HomeSheetState createState() => _HomeSheetState();
}

class _HomeSheetState extends State<HomeSheet> {
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
