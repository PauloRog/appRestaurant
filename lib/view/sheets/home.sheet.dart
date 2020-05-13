import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeSheet extends StatelessWidget {
  HomeSheet({Key key, this.select}) : super(key:key);

  final String select;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection(select).document('home').snapshots(),
      builder: (context, snapshot) {
        switch(snapshot.connectionState) {
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
                ),
                Center(
                  child: Container(
                    height: 403,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      borderRadius: BorderRadius.circular(18)
                    ),
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
                                fontSize: 18,
                                fontFamily: 'Rock Salt',
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              opening,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Stint Ultra',
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              note,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Stint Ultra'
                              ),
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
      }
    );
  }
}