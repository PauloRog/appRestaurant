import 'package:app_restaurant_test/model/colors.rgba.dart';
import 'package:app_restaurant_test/model/icon.model.dart';
import 'package:app_restaurant_test/store/bottom.navigation.bar.store.dart';
import 'package:app_restaurant_test/view/pages/admin.page.dart';
import 'package:app_restaurant_test/view/sheets/contact.sheet.dart';
import 'package:app_restaurant_test/view/sheets/drink.sheet.dart';
import 'package:app_restaurant_test/view/sheets/food.sheet.dart';
import 'package:app_restaurant_test/view/sheets/home.sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.select}) : super(key: key);
  final String select;
  final BottomStore _store = BottomStore();
  final PageController _controller = PageController();

  void goAdmin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AdminPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    List<Widget> _pages = [
      HomeSheet(
        select: select,
      ),
      FoodSheet(select: select),
      DrinkSheet(select: select),
      ContactSheet(
        select: select,
      ),
    ];
    return StreamBuilder(
      stream:
          Firestore.instance.collection(select).document('theme').snapshots(),
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
            MyIcons icons = MyIcons.fromJson(snapshot.data['icons']);
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50.0), // here the desired height
                child: AppBar(
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(
                        colorText.r,
                        colorText.g,
                        colorText.b,
                        colorText.o,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  backgroundColor: Color.fromRGBO(
                    background.r,
                    background.g,
                    background.b,
                    background.o,
                  ),
                  title: Text(
                    titleAppBar,
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
                  actions: <Widget>[
                    Observer(
                      builder: (context) {
                        return (icons != null)
                            ? (_store.index == 3)
                                ? IconButton(
                                    icon: SvgPicture.network(
                                      icons.config,
                                      width: 32,
                                      height: 32,
                                    ),
                                    onPressed: () {
                                      goAdmin(context);
                                    },
                                  )
                                : Text('')
                            : Text('');
                      },
                    ),
                  ],
                ),
              ),
              body: PageView.builder(
                itemCount: _pages.length,
                onPageChanged: _store.setIndex,
                controller: _controller,
                itemBuilder: (context, position) => _pages[position],
              ),
              bottomNavigationBar: SizedBox(
                height: 50,
                child: Observer(
                  builder: (context) {
                    return (icons != null)
                        ? BottomNavigationBar(
                            currentIndex: _store.index,
                            selectedItemColor: Colors.blue,
                            onTap: (index) {
                              _store.setIndex(index);
                              _controller.animateToPage(
                                _store.index,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.linear,
                              );
                            },
                            items: [
                              BottomNavigationBarItem(
                                title: Text('Home'),
                                icon: SvgPicture.network(
                                  icons.home,
                                  width: screenWidth / 11,
                                  height: kBottomNavigationBarHeight - 36,
                                ),
                                backgroundColor: Color.fromRGBO(
                                  background.r,
                                  background.g,
                                  background.b,
                                  background.o,
                                ),
                              ),
                              BottomNavigationBarItem(
                                title: Text('Food'),
                                icon: SvgPicture.network(
                                  icons.food,
                                  width: screenWidth / 11,
                                  height: kBottomNavigationBarHeight - 38,
                                ),
                                backgroundColor: Color.fromRGBO(
                                  background.r,
                                  background.g,
                                  background.b,
                                  background.o,
                                ),
                              ),
                              BottomNavigationBarItem(
                                title: Text('Drink'),
                                icon: SvgPicture.network(
                                  icons.drink,
                                  width: screenWidth / 11,
                                  height: kBottomNavigationBarHeight - 38,
                                ),
                                backgroundColor: Color.fromRGBO(
                                  background.r,
                                  background.g,
                                  background.b,
                                  background.o,
                                ),
                              ),
                              BottomNavigationBarItem(
                                title: Text('Contact'),
                                icon: SvgPicture.network(
                                  icons.contact,
                                  width: screenWidth / 11,
                                  height: kBottomNavigationBarHeight - 38,
                                ),
                                backgroundColor: Color.fromRGBO(
                                  background.r,
                                  background.g,
                                  background.b,
                                  background.o,
                                ),
                              ),
                            ],
                          )
                        : CircularProgressIndicator();
                  },
                ),
              ),
            );
        }
      },
    );
  }
}
