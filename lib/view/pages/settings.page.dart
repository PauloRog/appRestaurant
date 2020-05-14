import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettAll extends StatefulWidget {
  @override
  _SettAll createState() => _SettAll();
}

class _SettAll extends State<SettAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromRGBO(200, 200, 200, 1),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 56,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(145, 145, 145, 1),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      child: SizedBox.expand(
                        child: FlatButton(
                          onPressed: () {
                            print("olá mundo");
                          },
                          child: Text(
                            "Opções",
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 56,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(37, 166, 83, 1),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      child: SizedBox.expand(
                        child: FlatButton(
                          onPressed: () {
                            print("olá mundo");
                          },
                          child: Text(
                            "Adicionar",
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
                Container(),
              ]),
        ),
      ),
    );
  }
}
