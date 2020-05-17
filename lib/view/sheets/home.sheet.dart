import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/colors.rgba.dart';

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
    final double screenHeight = MediaQuery.of(context).size.height;
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
                    child: Container(
                      height: screenHeight * 0.65,
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
