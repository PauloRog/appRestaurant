import 'package:flutter/material.dart';
import 'package:app_restaurant_test/view/pages/home.page.dart';

class AdmLogin extends StatefulWidget {
  @override
  _AdmLogin createState() => _AdmLogin();
}

class _AdmLogin extends State<AdmLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.purple,
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
              SizedBox(
                height: 40,
              ),
              Container(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Senha",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                width: 185,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(113, 00, 00, 1),
                      Color.fromRGBO(187, 98, 98, 1),
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
      ),
    );
  }
}
