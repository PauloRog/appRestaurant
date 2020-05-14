import 'package:app_restaurant_test/models/appBarGradient.dart';
import 'package:app_restaurant_test/view/pages/add.page.dart';
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
          color: Color.fromRGBO(200, 200, 200, 1),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
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
                    SizedBox(
                        width: 34,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddPage(),
                                ));
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: SizedBox(
                    height: 150,
                    width: 414,
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
