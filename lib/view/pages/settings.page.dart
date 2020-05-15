import 'package:app_restaurant_test/models/appBarGradient.dart';
import 'package:app_restaurant_test/models/colors.rgba.dart';
import 'package:app_restaurant_test/store/bottom.navigation.bar.store.dart';
import 'package:app_restaurant_test/view/pages/add.page.dart';
import 'package:app_restaurant_test/view/pages/home.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SettAll extends StatefulWidget {
  @override
  _SettAll createState() => _SettAll();
}

class _SettAll extends State<SettAll> {
  void goHome(int index) {
    if (index == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    select: 'restaurant',
                  )));
    } else if (index == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    select: 'restaurant',
                  )));
    } else if (index == 2) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    select: 'restaurant',
                  )));
    } else if (index == 3) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    select: 'restaurant',
                  )));
    }
  }

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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
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
                        ]),
                  ),
                ),
                bottomNavigationBar: SizedBox(
                  height: 50,
                  child: Observer(builder: (context) {
                    return (_store.icons != null)
                        ? BottomNavigationBar(
                            showSelectedLabels: false,
                            showUnselectedLabels: false,
                            currentIndex: _store.index,
                            unselectedItemColor: Color.fromRGBO(colorText.r,
                                colorText.g, colorText.b, colorText.o),
                            items: [
                              BottomNavigationBarItem(
                                icon: SvgPicture.network(
                                  _store.icons[0].link,
                                  height: kBottomNavigationBarHeight - 38,
                                ),
                                title: Text(_store.icons[0].name),
                                backgroundColor: Color.fromRGBO(background.r,
                                    background.g, background.b, background.o),
                              ),
                              BottomNavigationBarItem(
                                icon: SvgPicture.network(
                                  _store.icons[1].link,
                                  height: kBottomNavigationBarHeight - 38,
                                ),
                                title: Text(_store.icons[1].name),
                                backgroundColor: Color.fromRGBO(background.r,
                                    background.g, background.b, background.o),
                              ),
                              BottomNavigationBarItem(
                                icon: SvgPicture.network(
                                  _store.icons[2].link,
                                  height: kBottomNavigationBarHeight - 38,
                                ),
                                title: Text(_store.icons[2].name),
                                backgroundColor: Color.fromRGBO(background.r,
                                    background.g, background.b, background.o),
                              ),
                              BottomNavigationBarItem(
                                icon: SvgPicture.network(
                                  _store.icons[3].link,
                                  height: kBottomNavigationBarHeight - 38,
                                ),
                                title: Text(_store.icons[3].name),
                                backgroundColor: Color.fromRGBO(background.r,
                                    background.g, background.b, background.o),
                              ),
                            ],
                            onTap: (index) {
                              _store.setIndex(index);
                              goHome(index);
                            })
                        : CircularProgressIndicator();
                  }),
                ),
              );
          }
        });
  }
}
