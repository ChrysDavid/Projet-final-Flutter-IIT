import 'package:flutter/material.dart';
import 'package:jj_vr/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class PartieSiteWeb extends StatefulWidget {
  const PartieSiteWeb({Key? key}) : super(key: key);

  @override
  _PartieSiteWebState createState() => _PartieSiteWebState();
}

class _PartieSiteWebState extends State<PartieSiteWeb> {
  TextEditingController urlController = TextEditingController();
  bool isLinkValid = true;

  void validateUrl(String value) {
    setState(() {
      isLinkValid = Uri.parse(value).isAbsolute;
    });
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void showEditDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Website Link'),
          content: TextField(
            controller: urlController,
            onChanged: validateUrl,
            decoration: InputDecoration(
              hintText: 'Enter your website link',
              errorText: isLinkValid ? null : 'Invalid URL',
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                if (isLinkValid) {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(22 * fem, 0 * fem, 0 * fem, 18 * fem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: showEditDialog,
              ),
            ],
          ),
          SizedBox(height: 4 * fem),
          GestureDetector(
            onTap: isLinkValid
                ? () {
                    launchURL(urlController.text);
                  }
                : null,
            child: Text(
              urlController.text,
              style: TextStyle(
                fontSize: 20 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.2575 * ffem / fem,
                color: isLinkValid ? Color(0xff6791ff) : Colors.red,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
