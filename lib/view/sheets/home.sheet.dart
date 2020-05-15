import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeSheet extends StatefulWidget {
  HomeSheet(this.select);

  final String select;
  @override
  _HomeSheetState createState() => _HomeSheetState();
}

class _HomeSheetState extends State<HomeSheet> {
  @override
  Widget build(BuildContext context) {
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 50.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Marguerite",
                                fontSize: 26.0,
                                color: Color.fromRGBO(0, 0, 0, 1),
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
                                color: Color.fromRGBO(0, 0, 0, 1),
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
                                color: Color.fromRGBO(0, 0, 0, 1),
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
