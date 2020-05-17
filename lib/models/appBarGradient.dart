import 'package:flutter/material.dart';

class AppBarGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromRGBO(113, 00, 00, 1),
                Color.fromRGBO(187, 98, 98, 1),
              ],
              tileMode: TileMode.clamp)),
    );
  }
}
