import 'package:app_restaurant_test/store/drop.down.store.dart';
import 'package:app_restaurant_test/view/pages/add.page.dart';
import 'package:app_restaurant_test/view/widgets/my.list.view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import '../../models/colors.rgba.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void goHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPage()),
    );
  }

  final List<String> option = ['Opções', 'Principais', 'Porções', 'Bebidas'];
  final DropDownStore store = DropDownStore();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
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
            Map icons = snapshot.data['icons'];
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
                    height: screenHeight * 0.16,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: screenHeight * 0.07,
                            width: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(145, 145, 145, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Center(child: Observer(
                              builder: (context) {
                                return DropdownButton<String>(
                                  dropdownColor:
                                      Color.fromRGBO(145, 145, 145, 1),
                                  items: option.map(
                                    (String e) {
                                      return DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: TextStyle(),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (String item) {
                                    store.selectOption(item);
                                  },
                                  value: store.select,
                                );
                              },
                            )),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            height: screenHeight * 0.07,
                            width: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(37, 166, 83, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: FlatButton(
                              onPressed: () {
                                goHome(context);
                              },
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: SvgPicture.network(
                                      icons['add'],
                                      width: screenWidth * 0.15,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Text('ADICIONAR'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Observer(builder: (context) {
                    return Expanded(
                      child: MyListView(
                        icons: icons,
                        filter: store.select,
                      ),
                    );
                  }),
                ],
              ),
            );
        }
      },
    );
  }
}
