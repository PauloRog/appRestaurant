import 'package:app_restaurant_test/model/colors.rgba.dart';
import 'package:app_restaurant_test/view/pages/home.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SelectionPage extends StatelessWidget {
  void goHome(BuildContext context, String select) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(
                select: select,
              )),
    );
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
              ColorsRgba colorText =
                  ColorsRgba.fromJson(snapshot.data['colorText']);
              ColorsRgba firstGradient =
                  ColorsRgba.fromJson(snapshot.data['firstGradient']);
              ColorsRgba secondGradient =
                  ColorsRgba.fromJson(snapshot.data['secondGradient']);
              return Stack(
                children: <Widget>[
                  Image(
                    image: NetworkImage(background),
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
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
                                Color.fromRGBO(firstGradient.r, firstGradient.g,
                                    firstGradient.b, firstGradient.o),
                                Color.fromRGBO(
                                    secondGradient.r,
                                    secondGradient.g,
                                    secondGradient.b,
                                    secondGradient.o),
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                              width: 2,
                            ),
                          ),
                          child: SizedBox.expand(
                            child: FlatButton(
                              onPressed: () {
                                goHome(context, 'restaurant');
                              },
                              child: Text(
                                titleRestaurant,
                                style: TextStyle(
                                  fontFamily: 'Capriola',
                                  color: Color.fromRGBO(colorText.r,
                                      colorText.g, colorText.b, colorText.o),
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
                                Color.fromRGBO(
                                    secondGradient.r,
                                    secondGradient.g,
                                    secondGradient.b,
                                    secondGradient.o),
                                Color.fromRGBO(firstGradient.r, firstGradient.g,
                                    firstGradient.b, firstGradient.o),
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                              width: 2,
                            ),
                          ),
                          child: SizedBox.expand(
                            child: FlatButton(
                              onPressed: () {
                                goHome(context, 'pub');
                              },
                              child: Text(
                                titlePub,
                                style: TextStyle(
                                  fontFamily: 'Capriola',
                                  color: Color.fromRGBO(colorText.r,
                                      colorText.g, colorText.b, colorText.o),
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
        },
      ),
    );
  }
}
