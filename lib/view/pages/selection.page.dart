import 'package:app_restaurant_test/view/pages/home.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SelectPage extends StatefulWidget {
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  void goHome(String select) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  select: select,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance
              .collection('standard')
              .document('selectPage')
              .snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                String background = snapshot.data['background'];
                String titleRestaurant = snapshot.data['titleRestaurant'];
                String titlePub = snapshot.data['titlePub'];
                return Stack(
                  children: <Widget>[
                    Image(
                      image: NetworkImage(background),
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton(
                                onPressed: () {
                                  goHome('restaurant');
                                },
                                child: Text(
                                  titleRestaurant,
                                  style: TextStyle(
                                    fontFamily: "Capriola",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
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
                                  Color.fromRGBO(53, 10, 0, 1),
                                  Color.fromRGBO(156, 44, 12, 1),
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton(
                                onPressed: () {
                                  goHome('pub');
                                },
                                child: Text(
                                  titlePub,
                                  style: TextStyle(
                                    fontFamily: "Capriola",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
            }
          }),
    );
  }
}
