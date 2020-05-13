import 'package:app_restaurant_test/view/pages/selection.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 10),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context)
            => SelectionPage()
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance
            .collection('standard')
            .document('splashScreen')
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
                          Stack(
                            children: <Widget>[
                              // Stroked text as border.
                              Text(
                                title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: "Marguerite",
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 6
                                    ..color = Colors.white,
                                ),
                              ),
                              // Solid text as fill.
                              Text(
                                title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontFamily: "Marguerite",
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
          }),
    );
  }
}
