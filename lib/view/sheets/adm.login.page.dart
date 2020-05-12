import 'package:app_restaurant_test/view/sheets/settings.all.sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:app_restaurant_test/view/pages/home.page.dart';

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
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Digite Sua Senha:",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(35.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Senha",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 214,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)
                            => SettAll(),
                          )
                      );
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
            ],
          ),
        ),
      ),
    );
  }
}
