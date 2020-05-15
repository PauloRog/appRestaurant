import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Twin's Admin",
            style: TextStyle(fontFamily: 'Marguerite', color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(133, 0, 0, 1)),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Digite Sua Senha:",
                style: TextStyle(
                  fontFamily: "Capriola",
                  fontSize: screenWidth * 0.06,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: screenHeight * 0.18,
                width: screenWidth * 0.85,
                padding: const EdgeInsets.all(30),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Senha",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
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
                    colors: <Color>[
                      Color.fromRGBO(113, 00, 00, 1),
                      Color.fromRGBO(187, 98, 98, 1),
                    ],
                    tileMode: TileMode.clamp,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Continuar",
                      style: TextStyle(
                        fontFamily: "Capriola",
                        fontSize: 24,
                        color: Colors.white,
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
