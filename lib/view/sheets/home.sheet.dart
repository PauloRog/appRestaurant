import 'package:app_restaurant_test/model/colors.rgba.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeSheet extends StatelessWidget {
  HomeSheet({Key key, this.select}) : super(key: key);

  final String select;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return StreamBuilder(
        stream:
            Firestore.instance.collection(select).document('home').snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              String background = snapshot.data['background'];
              String title = snapshot.data['title'];
              String opening = snapshot.data['opening'];
              String note = snapshot.data['note'];
              ColorsRgba colorText =
                  ColorsRgba.fromJson(snapshot.data['colorText']);
              ColorsRgba colorBackground =
                  ColorsRgba.fromJson(snapshot.data['colorBackground']);
              return Stack(
                children: <Widget>[
                  Image(
                    image: NetworkImage(background),
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                  Center(
                    child: Container(
                      height: screenHeight * 0.60,
                      width: screenWidth * 0.95,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(
                              colorBackground.r,
                              colorBackground.g,
                              colorBackground.b,
                              colorBackground.o),
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: screenWidth * 0.065,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Marguerite',
                                    color: Color.fromRGBO(colorText.r,
                                        colorText.g, colorText.b, colorText.o)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                opening,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: screenWidth * 0.055,
                                    fontFamily: 'Stint Ultra',
                                    color: Color.fromRGBO(colorText.r,
                                        colorText.g, colorText.b, colorText.o)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                note,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: screenWidth * 0.050,
                                    fontFamily: 'Stint Ultra',
                                    color: Color.fromRGBO(colorText.r,
                                        colorText.g, colorText.b, colorText.o)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
          }
        });
  }
}
