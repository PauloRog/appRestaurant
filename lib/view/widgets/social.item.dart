import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/colors.rgba.dart';
import '../../models/social.model.dart';

class SocialItem extends StatelessWidget {
  SocialItem({Key key, this.item, this.colorText}) : super(key: key);

  Future<void> _launch(String url) async {
    if (await canLaunch(url)) {
      final bool succeded = await launch(url,
          forceSafariVC: false, forceWebView: false, universalLinksOnly: true);
      if (!succeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  final Network item;
  final ColorsRgba colorText;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: 250,
        alignment: Alignment.center,
        child: FlatButton(
          onPressed: () {
            _launch(item.link);
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              children: <Widget>[
                SvgPicture.network(item.icon, height: screenHeight * 0.048),
                SizedBox(
                  width: 8,
                ),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: Color.fromRGBO(
                        colorText.r, colorText.g, colorText.b, colorText.o),
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
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
