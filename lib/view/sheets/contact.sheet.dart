import 'package:app_restaurant_test/view/widgets/social.item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/colors.rgba.dart';
import '../../models/social.model.dart';

class ContactSheet extends StatefulWidget {
  ContactSheet({Key key, this.select}) : super(key: key);
  final String select;
  @override
  _ContactSheetState createState() => _ContactSheetState();
}

class _ContactSheetState extends State<ContactSheet> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: Firestore.instance
            .collection(widget.select)
            .document('contact')
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
              Social social = Social.fromJson(snapshot.data['social']);
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
                        margin: EdgeInsets.symmetric(vertical: 50.0),
                        child: Column(
                          children: <Widget>[
                            SocialItem(
                              item: social.facebook,
                              colorText: social.colorText,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SocialItem(
                              item: social.instagram,
                              colorText: social.colorText,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SocialItem(
                              item: social.whatsapp,
                              colorText: social.colorText,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SocialItem(
                              item: social.twitter,
                              colorText: social.colorText,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SocialItem(
                              item: social.phone,
                              colorText: social.colorText,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SocialItem(
                              item: social.maps,
                              colorText: social.colorText,
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
