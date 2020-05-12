import 'package:app_restaurant_test/models/appBarGradient.dart';
import 'package:app_restaurant_test/store/bottom.navigation.bar.store.dart';
import 'package:app_restaurant_test/view/sheets/contact.sheet.dart';
import 'package:app_restaurant_test/view/sheets/drink.sheet.dart';
import 'package:app_restaurant_test/view/sheets/food.sheet.dart';
import 'package:app_restaurant_test/view/sheets/home.sheet.dart';
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
    void goHome() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => (
                  select: select,
                )));
  }
    BottomStore _store = BottomStore();
    List<Widget> _pages = [HomeSheet(), FoodSheet(), DrinkSheet(), ContactSheet(),];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          flexibleSpace: AppBarGradient(),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            "Twin’s Bar & Restaurant",
            style: TextStyle(
              fontFamily: "Marguerite",
              color: Colors.white,
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
                    colors: <Color>[
                      Color.fromRGBO(113, 00, 00, 1),
                      Color.fromRGBO(187, 98, 98, 1),
                    ],
                    tileMode: TileMode.clamp,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettAll(),
                          ));
                    },
                    child: Text(
                      "Continuar",
                      style: TextStyle(
                        fontSize: 26,
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
      bottomNavigationBar: SizedBox(
          height: 50,
          child: BottomNavigationBar(

          ),
      ),
    );
  }
}
