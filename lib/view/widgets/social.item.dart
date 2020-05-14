import 'package:app_restaurant_test/model/social.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialItem extends StatelessWidget {
  SocialItem({Key key, this.item, this.url}) : super(key: key);

  Future<void> _launch(String url) async {
    if(await canLaunch(url)) {
      final bool succeded = await launch(url, forceSafariVC: false, forceWebView: false, universalLinksOnly: true);
      if(!succeded) {
        await launch(url, forceSafariVC: true);
      }
    }
    
  }

  final Network item;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        width: 250,
        alignment: Alignment.center,
        child: FlatButton(
          onPressed: () {
            _launch(url);
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              children: <Widget>[
                SvgPicture.network(
                  item.icon,
                  height: 32,
                  width: 32,
                ),
                SizedBox(width: 5,),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
