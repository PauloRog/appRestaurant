import 'package:app_restaurant_test/model/colors.rgba.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('admin').document('theme').snapshots(),
      builder: (context, snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator(),);
          default:
            String title = snapshot.data['title'];
            ColorsRgba colorText = ColorsRgba.fromJson(snapshot.data['colorText']);
            ColorsRgba background = ColorsRgba.fromJson(snapshot.data['background']);
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Color.fromRGBO(
                  background.r,
                  background.g,
                  background.b,
                  background.o,
                ),
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(
                        colorText.r,
                        colorText.g,
                        colorText.b,
                        colorText.o
                      )
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    color: Color.fromRGBO(
                      colorText.r,
                      colorText.g,
                      colorText.b,
                      colorText.o,
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Comida'),
                  ),
                  ListTile(
                    title: Text('Comida'),
                  ),
                  ListTile(
                    title: Text('Comida'),
                  ),
                  ListTile(
                    title: Text('Babida'),
                  ),
                  ListTile(
                    title: Text('bebida'),
                  ),
                  ListTile(
                    title: Text('Bebida'),
                  ),
                  ListTile(
                    title: Text('Comida'),
                  ),
                  ListTile(
                    title: Text('Comida'),
                  ),
                  ListTile(
                    title: Text('Comida'),
                  ),
                  ListTile(
                    title: Text('Babida'),
                  ),
                  ListTile(
                    title: Text('bebida'),
                  ),
                  ListTile(
                    title: Text('Bebida'),
                  ),
                  ListTile(
                    title: Text('Comida'),
                  ),
                  ListTile(
                    title: Text('Comida'),
                  ),
                  ListTile(
                    title: Text('Comida'),
                  ),
                  ListTile(
                    title: Text('Babida'),
                  ),
                  ListTile(
                    title: Text('bebida'),
                  ),
                  ListTile(
                    title: Text('Bebida'),
                  ),
                ],
              ),
            );
        }
      }
    );
  }
}