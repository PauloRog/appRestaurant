import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSheet extends StatefulWidget {
  @override
  _ContactSheetState createState() => _ContactSheetState();
}

class _ContactSheetState extends State<ContactSheet> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('restaurant')
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
              String title = snapshot.data['title'];
              Map social = snapshot.data['social'];
              Map facebook = social['facebook'];
              Map instagram = social['instagram'];
              Map twitter = social['twitter'];
              Map maps = social['maps'];
              Map phone = social['phone'];
              Map whatsapp = social['whatsapp'];
              Map name = maps['name'];
              String rua = name['rua'];
              String bairro = name['bairro'];
              String cidade = name['cidade'];

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
                            Container(
                              margin: EdgeInsets.all(5.0),
                              alignment: Alignment.center,
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: SvgPicture.network(
                                      instagram['icon'],
                                      fit: BoxFit.cover,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: InkWell(
                                    child: Text(
                                      instagram['name'],
                                      style: TextStyle(
                                        fontFamily: "Rubik",
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                    onTap: () async {
                                      if (await canLaunch("link")) {
                                        await launch("link");
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: SvgPicture.network(
                                      facebook['icon'],
                                      fit: BoxFit.cover,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: InkWell(
                                    child: Text(
                                      facebook['name'],
                                      style: TextStyle(
                                        fontFamily: "Rubik",
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                    onTap: () async {
                                      if (await canLaunch("link")) {
                                        await launch("link");
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: SvgPicture.network(
                                      twitter['icon'],
                                      fit: BoxFit.cover,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: InkWell(
                                    child: Text(
                                      twitter['name'],
                                      style: TextStyle(
                                        fontFamily: "Rubik",
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                    onTap: () async {
                                      if (await canLaunch("link")) {
                                        await launch("link");
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: SvgPicture.network(
                                      whatsapp['icon'],
                                      fit: BoxFit.cover,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: InkWell(
                                    child: Text(
                                      whatsapp['name'],
                                      style: TextStyle(
                                        fontFamily: "Rubik",
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                    onTap: () async {
                                      if (await canLaunch("link")) {
                                        await launch("link");
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: SvgPicture.network(
                                      phone['icon'],
                                      fit: BoxFit.cover,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: InkWell(
                                    child: Text(
                                      phone['name'],
                                      style: TextStyle(
                                        fontFamily: "Rubik",
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                    onTap: () async {
                                      if (await canLaunch("link")) {
                                        await launch("link");
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: SvgPicture.network(
                                      maps['icon'],
                                      fit: BoxFit.cover,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: InkWell(
                                    child: Text(
                                      "$rua\n$bairro\n$cidade",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Rubik",
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                    onTap: () async {
                                      if (await canLaunch("link")) {
                                        await launch("link");
                                      }
                                    },
                                  ),
                                ),
                              ],
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
