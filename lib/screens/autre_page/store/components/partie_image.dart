import 'package:flutter/material.dart';
import 'package:jj_vr/constants.dart';
import 'package:jj_vr/map/map_screen.dart';

class PartieImage extends StatefulWidget {
  const PartieImage({Key? key}) : super(key: key);

  @override
  State<PartieImage> createState() => _PartieImageState();
}

class _PartieImageState extends State<PartieImage> {
  bool _isSubscribed = false;

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Voulez-vous vous désabonner ?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _isSubscribed = false;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                onPrimary: Color(0xff000000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Oui'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                onPrimary: Color(0xff000000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Non'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidths = MediaQuery.of(context).size.width;
    double fem = screenWidths / 411;
    double ffem = fem * 0.97;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 28 * fem),
          width: screenWidths,
          height: 370 * fem,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/download-3-zwN.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 22 * fem,
                top: 232 * fem,
                child: SizedBox(
                  width: 120.85 * fem,
                  height: 120 * fem,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(141 * fem),
                    child: Image.asset(
                      'assets/images/download-3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 169 * fem,
                top: 250 * fem,
                child: SizedBox(
                  child: Text(
                    'Mon Entreprise',
                    style: TextStyle(
                      fontSize: 25 * ffem,
                      fontWeight: FontWeight.w900,
                      height: 1.3175 * ffem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 358 * fem,
                top: 292 * fem,
                child: SizedBox(
                  width: 30.72 * fem,
                  height: 40 * fem,
                  child: IconButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => MapScreen(),
                      ),
                    ),
                    icon: Icon(
                      Icons.location_on,
                      size: 40 * fem,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 169 * fem,
                top: 290 * fem,
                child: ElevatedButton(
                  onPressed: () {
                    if (_isSubscribed) {
                      _showConfirmationDialog();
                    } else {
                      setState(() {
                        _isSubscribed = true;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _isSubscribed ? Colors.grey : kPrimaryColor,
                    onPrimary: Color(0xff000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10 * fem),
                    ),
                  ),
                  child: Container(
                    width: 136 * fem,
                    height: 31 * fem,
                    alignment: Alignment.center,
                    child: Text(
                      _isSubscribed ? 'Abonné' : 'S\'abonner',
                      style: TextStyle(
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.2575 * ffem,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(22 * fem, 0 * fem, 0 * fem, 16 * fem),
          width: double.infinity,
          height: 34 * fem,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 42 * fem),
                width: 141 * fem,
                height: 34 * fem,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Action à effectuer lors du clic sur le bouton Chat
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    onPrimary: Color(0xff000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10 * fem),
                    ),
                  ),
                  icon: Icon(
                    Icons.chat,
                    size: 24 * ffem,
                  ),
                  label: Text(
                    'Chat',
                    style: TextStyle(
                      fontSize: 24 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2575 * ffem,
                    ),
                  ),
                ),
              ),
              Container(
                width: 181 * fem,
                height: 34 * fem,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Action à effectuer lors du clic sur le bouton Share profil
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    onPrimary: Color(0xff000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10 * fem),
                    ),
                  ),
                  icon: Icon(
                    Icons.share,
                    size: 24 * ffem,
                  ),
                  label: Text(
                    'Share profil',
                    style: TextStyle(
                      fontSize: 24 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2575 * ffem,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
