import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PartieSiteWeb extends StatelessWidget {
  const PartieSiteWeb({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / 411;
    double ffem = fem * 0.97;

    return Container(
      margin: EdgeInsets.fromLTRB(22 * fem, 0 * fem, 0 * fem, 18 * fem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Web site :',
            style: TextStyle(
              fontSize: 24 * ffem,
              fontWeight: FontWeight.w500,
              height: 1.2575 * ffem / fem,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4 * fem),
          GestureDetector(
            onTap: () {
              _launchURL('https://github.com/ChrysDavid/');
            },
            child: Text(
              'ChrysDavid.com',
              style: TextStyle(
                fontSize: 20 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.2575 * ffem / fem,
                color: const Color(0xff6791ff),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('Impossible de lancer l\'URL $url');
    }
  }
}
