import 'package:app_restaurant_test/view/pages/selection.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/colors.rgba.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SelectionPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance
              .collection('standard')
              .document('splashScreen')
              .snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                {
                  String background = snapshot.data['background'];
                  String title = snapshot.data['title'];
                  ColorsRgba colorBackground =
                      ColorsRgba.fromJson(snapshot.data['colorBackground']);
                  ColorsRgba colorText =
                      ColorsRgba.fromJson(snapshot.data['colorText']);
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
                            Stack(
                              children: <Widget>[
                                // Stroked text as border.
                                Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.045,
                                    fontFamily: 'Marguerite',
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 6
                                      ..color = Color.fromRGBO(
                                          colorBackground.r,
                                          colorBackground.g,
                                          colorBackground.b,
                                          colorBackground.o),
                                  ),
                                ),
                                // Solid text as fill.
                                Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.045,
                                    fontFamily: 'Marguerite',
                                    color: Color.fromRGBO(colorText.r,
                                        colorText.g, colorText.b, colorText.o),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 250,
                            ),
                            CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    ],
                  );
                }
            }
          }),
    );
  }
}
