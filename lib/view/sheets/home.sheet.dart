import 'package:app_restaurant_test/model/colors.rgba.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeSheet extends StatefulWidget {
  HomeSheet({Key key, this.select}) : super(key: key);

  final String select;
  @override
  _HomeSheetState createState() => _HomeSheetState();
}

class _HomeSheetState extends State<HomeSheet> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: Firestore.instance
            .collection(widget.select)
            .document('home')
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
                    width: double.infinity,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Container(
                        width: screenWidth * 0.95,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                colorBackground.r,
                                colorBackground.g,
                                colorBackground.b,
                                colorBackground.o),
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.symmetric(vertical: 50.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Marguerite",
                                fontSize: 26.0,
                                color: Color.fromRGBO(colorText.r, colorText.g,
                                    colorText.b, colorText.o),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              opening,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Capriola",
                                fontSize: 24.0,
                                color: Color.fromRGBO(colorText.r, colorText.g,
                                    colorText.b, colorText.o),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              note,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Capriola",
                                fontSize: 20.0,
                                color: Color.fromRGBO(colorText.r, colorText.g,
                                    colorText.b, colorText.o),
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
