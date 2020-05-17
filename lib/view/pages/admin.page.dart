import 'package:app_restaurant_test/view/pages/settings.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  String password;
  String typedPassword;

  bool _checkPassword() {
    return typedPassword == password;
  }

  void _getPassword() async {
    DocumentSnapshot document =
        await Firestore.instance.collection('admin').document('login').get();
    password = document.data['password'];
  }

  @override
  Widget build(BuildContext context) {
    _getPassword();
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Twin's  Admin",
          style: TextStyle(fontFamily: 'Marguerite', color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(113, 0, 0, 1),
                Color.fromRGBO(187, 98, 98, 1)
              ],
            ),
          ),
        ),
      ),
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
                  onChanged: (value) {
                    setState(() {
                      typedPassword = value;
                    });
                  },
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
                    colors: [
                      Color.fromRGBO(113, 0, 0, 1),
                      Color.fromRGBO(187, 98, 98, 1)
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    onPressed: () {
                      if (_checkPassword()) {
                        Toast.show('Senha correta', context,
                            gravity: Toast.TOP,
                            duration: 1,
                            backgroundColor: Color.fromRGBO(0, 255, 0, 0.8));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsPage(),
                          ),
                        );
                      } else {
                        print('Senha incorreta');
                        Toast.show('Senha incorreta', context,
                            gravity: Toast.TOP,
                            duration: 5,
                            backgroundColor: Color.fromRGBO(255, 0, 0, 0.8));
                      }
                    },
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
