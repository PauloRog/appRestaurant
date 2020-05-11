import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_restaurant_test/view/pages/home.page.dart';

class AdmLogin extends StatefulWidget {
  @override
  _AdmLogin createState() => _AdmLogin();
}

class _AdmLogin extends State<AdmLogin> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        color: Colors.blue,
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Digite Sua Senha:",
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
            ),
            Container(
              child:TextField(
                decoration: InputDecoration.collapsed(hintText: 'Blá Blá'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 185,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(156, 44, 12, 1),
                    Color.fromRGBO(53, 10, 0, 1),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  onPressed: () {
                    print("pressionado demais");
                  },
                  child: Text(
                    "Continuar",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ]);
  }
}
