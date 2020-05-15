import 'package:app_restaurant_test/models/colors.rgba.dart';
import 'package:app_restaurant_test/store/bottom.navigation.bar.store.dart';
import 'package:app_restaurant_test/view/sheets/contact.sheet.dart';
import 'package:app_restaurant_test/view/sheets/drink.sheet.dart';
import 'package:app_restaurant_test/view/sheets/food.sheet.dart';
import 'package:app_restaurant_test/view/sheets/home.sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app_restaurant_test/view/pages/adm.login.page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.select, this.index}) : super(key: key);
  final String select;
  final int index;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomStore _store = BottomStore();
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      HomeSheet(widget.select),
      FoodSheet(widget.select),
      DrinkSheet(widget.select),
      ContactSheet(),
      AdmLogin(),
    ];
    if (widget.index != null) {
      _store.setIndex(widget.index);
    }
    _store.setIcons(widget.select);
    return StreamBuilder(
      stream: Firestore.instance
          .collection(widget.select)
          .document('theme')
          .snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            String titleAppBar = snapshot.data['title'];
            ColorsRgba colorText =
                ColorsRgba.fromJson(snapshot.data['colorText']);
            ColorsRgba background =
                ColorsRgba.fromJson(snapshot.data['background']);
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50.0), // here the desired height
                child: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Color.fromRGBO(colorText.r, colorText.g,
                            colorText.b, colorText.o)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  centerTitle: true,
                  backgroundColor: Color.fromRGBO(
                      background.r, background.g, background.b, background.o),
                  title: Text(
                    titleAppBar,
                    style: TextStyle(
                      fontFamily: "Marguerite",
                      color: Color.fromRGBO(
                          colorText.r, colorText.g, colorText.b, background.o),
                    ),
                  ),
                  actions: <Widget>[
                    Observer(
                      builder: (context) {
                        return (_store.icons != null)
                            ? (_store.index == 3)
                                ? IconButton(
                                    icon: SvgPicture.network(
                                      _store.icons[4].link,
                                      width: 32,
                                      height: 32,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AdmLogin(),
                                          ));
                                    })
                                : Text('')
                            : Text('');
                      },
                    ),
                  ],
                ),
              ),
              body: PageView.builder(
                itemCount: _pages.length,
                itemBuilder: (context, position) => _pages[position],
                onPageChanged: _store.setIndex,
                controller: _pageController,
              ),
              bottomNavigationBar: SizedBox(
                height: 50,
                child: Observer(builder: (context) {
                  return (_store.icons != null)
                      ? BottomNavigationBar(
                          showSelectedLabels: false,
                          showUnselectedLabels: false,
                          currentIndex: _store.index,
                          unselectedItemColor: Color.fromRGBO(colorText.r,
                              colorText.g, colorText.b, colorText.o),
                          items: [
                            BottomNavigationBarItem(
                              icon: SvgPicture.network(
                                _store.icons[0].link,
                                height: kBottomNavigationBarHeight - 38,
                              ),
                              title: Text(_store.icons[0].name),
                              backgroundColor: Color.fromRGBO(background.r,
                                  background.g, background.b, background.o),
                            ),
                            BottomNavigationBarItem(
                              icon: SvgPicture.network(
                                _store.icons[1].link,
                                height: kBottomNavigationBarHeight - 38,
                              ),
                              title: Text(_store.icons[1].name),
                              backgroundColor: Color.fromRGBO(background.r,
                                  background.g, background.b, background.o),
                            ),
                            BottomNavigationBarItem(
                              icon: SvgPicture.network(
                                _store.icons[2].link,
                                height: kBottomNavigationBarHeight - 38,
                              ),
                              title: Text(_store.icons[2].name),
                              backgroundColor: Color.fromRGBO(background.r,
                                  background.g, background.b, background.o),
                            ),
                            BottomNavigationBarItem(
                              icon: SvgPicture.network(
                                _store.icons[3].link,
                                height: kBottomNavigationBarHeight - 38,
                              ),
                              title: Text(_store.icons[3].name),
                              backgroundColor: Color.fromRGBO(background.r,
                                  background.g, background.b, background.o),
                            ),
                          ],
                          onTap: (index) {
                            _store.setIndex(index);
                            _pageController.animateToPage(
                              _store.index,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.linear,
                            );
                          })
                      : CircularProgressIndicator();
                }),
              ),
            );
        }
      },
    );
  }
}
