import 'package:app_restaurant_test/model/social.model.dart';
import 'package:app_restaurant_test/view/widgets/social.item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactSheet extends StatelessWidget {
  ContactSheet({Key key, this.select}) : super(key:key);

  final String select;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
        .collection(select)
        .document('contact')
        .snapshots(),
      builder: (contex, snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            String background = snapshot.data['background'];
            Social social = Social.fromJson(snapshot.data['social']);
            return Stack(
              children: <Widget>[
                Image(
                  image: NetworkImage(background),
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
                Center(
                  child: Container(
                    height: 450,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      borderRadius: BorderRadius.circular(18)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SocialItem(item: social.facebook, url: social.facebook.link,),
                          SizedBox(height: 10,),
                          SocialItem(item: social.instagram),
                          SizedBox(height: 10,),
                          SocialItem(item: social.whatsapp),
                          SizedBox(height: 10,),
                          SocialItem(item: social.twitter),
                          SizedBox(height: 10,),
                          SocialItem(item: social.phone),
                          SizedBox(height: 20,),
                          SocialItem(item: social.maps),
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