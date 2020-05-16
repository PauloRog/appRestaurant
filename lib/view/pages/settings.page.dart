import 'package:app_restaurant_test/model/colors.rgba.dart';
import 'package:app_restaurant_test/view/widgets/drop.down.button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          Firestore.instance.collection('admin').document('theme').snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            String title = snapshot.data['title'];
            ColorsRgba firstColorApp = ColorsRgba.fromJson(
              snapshot.data['firstColorApp'],
            );
            ColorsRgba secondColorApp = ColorsRgba.fromJson(
              snapshot.data['secondColorApp'],
            );
            ColorsRgba colorText = ColorsRgba.fromJson(
              snapshot.data['colorText'],
            );
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Marguerite',
                    color: Color.fromRGBO(
                      colorText.r,
                      colorText.g,
                      colorText.b,
                      colorText.o,
                    ),
                  ),
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(
                          firstColorApp.r,
                          firstColorApp.g,
                          firstColorApp.b,
                          firstColorApp.o,
                        ),
                        Color.fromRGBO(
                          secondColorApp.r,
                          secondColorApp.g,
                          secondColorApp.b,
                          secondColorApp.o,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              body: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.blue,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 56,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(145, 145, 145, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Center(child: DropDown()),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                              height: 56, width: 150, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
