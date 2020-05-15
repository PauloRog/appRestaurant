import 'package:app_restaurant_test/models/colors.rgba.dart';
import 'package:app_restaurant_test/store/bottom.navigation.bar.store.dart';
import 'package:flutter/material.dart';
import 'package:app_restaurant_test/models/appBarGradient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPage createState() => _AddPage();
}

class _AddPage extends State<AddPage> {
  BottomStore _store = BottomStore();
  @override
  Widget build(BuildContext context) {
    _store.setIcons('admin');
    return StreamBuilder(
        stream: Firestore.instance
            .collection('admin')
            .document('theme')
            .snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              String titleAppBar = snapshot.data['title'];
              ColorsRgba colorText =
                  ColorsRgba.fromJson(snapshot.data['colorText']);
              ColorsRgba background =
                  ColorsRgba.fromJson(snapshot.data['background']);
              return Scaffold(
                appBar: PreferredSize(
                  preferredSize:
                      Size.fromHeight(50.0), // here the desired height
                  child: AppBar(
                    flexibleSpace: AppBarGradient(),
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    centerTitle: true,
                    title: Text(
                      titleAppBar,
                      style: TextStyle(
                        fontFamily: "Marguerite",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                body: Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 492,
                    width: 354,
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            //COLOCAR IMAGEM AQUI
                            width: 150,
                            height: 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 150,
                                height: 295,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Nome: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Capriola",
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        "Descrição: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Capriola",
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        "Preço: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Capriola",
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        "Categoria: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Capriola",
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        "Cardápio: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Capriola",
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                width: 150,
                                height: 295,
                                child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      TextField(
                                        textAlign: TextAlign.start,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Capriola",
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      TextField(
                                        textAlign: TextAlign.start,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Capriola",
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      TextField(
                                        textAlign: TextAlign.start,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Capriola",
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      TextField(
                                        textAlign: TextAlign.start,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Capriola",
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              );
          }
        });
  }
}
