import 'package:app_restaurant_test/model/colors.rgba.dart';
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

class HomePage extends StatefulWidget {

  HomePage({Key key, this.select}) : super(key:key);

  final String select;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomStore _store = BottomStore();
  
  PageController _controller = PageController();

  void goAdmin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context)
        => AdminPage()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _store.setIcons(widget.select);
    List<Widget> _pages = [
      HomeSheet(select: widget.select,),
      FoodSheet(),
      DrinkSheet(),
      ContactSheet()
    ];
    return StreamBuilder(
      stream: Firestore.instance.collection(widget.select).document('theme').snapshots(),
      builder: (context, snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            String titleAppBar = snapshot.data['title'];
            ColorsRgba colorText = ColorsRgba.fromJson(snapshot.data['colorText']);
            ColorsRgba background = ColorsRgba.fromJson(snapshot.data['background']);
            return Scaffold(
              appBar: AppBar(
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
                      return (_store.icons != null)
                      ?(_store.index == 3)
                      ? IconButton(
                        icon: SvgPicture.network(
                          _store.icons[4].link,
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
              body: PageView.builder(
                itemCount: _pages.length,
                onPageChanged: _store.setIndex,
                controller: _controller,
                itemBuilder: (context, position) => _pages[position],
              ),
              bottomNavigationBar: Observer(
                builder: (context) {
                  return (_store.icons != null)
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
                        title: Text(_store.icons[0].name),
                        icon: SvgPicture.network(
                          _store.icons[0].link,
                          width: 32,
                          height: 32,
                        ),
                        backgroundColor:Color.fromRGBO(
                          background.r,
                          background.g,
                          background.b,
                          background.o,
                        ),
                      ),
                      BottomNavigationBarItem(
                        title: Text(_store.icons[1].name),
                        icon: SvgPicture.network(
                          _store.icons[1].link,
                          width: 32,
                          height: 32,
                        ),
                        backgroundColor:Color.fromRGBO(
                          background.r,
                          background.g,
                          background.b,
                          background.o,
                        ),
                      ),
                      BottomNavigationBarItem(
                        title: Text(_store.icons[2].name),
                        icon: SvgPicture.network(
                          _store.icons[2].link,
                          width: 32,
                          height: 32,
                        ),
                        backgroundColor:Color.fromRGBO(
                          background.r,
                          background.g,
                          background.b,
                          background.o,
                        ),
                      ),
                      BottomNavigationBarItem(
                        title: Text(_store.icons[3].name),
                        icon: SvgPicture.network(
                          _store.icons[3].link,
                          width: 32,
                          height: 32,
                        ),
                        backgroundColor:Color.fromRGBO(
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
            );
        }
      },
    );
  }
}