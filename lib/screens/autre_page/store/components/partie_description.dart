import 'package:flutter/material.dart';

class PartieDecription extends StatefulWidget {
  const PartieDecription({Key? key});

  @override
  _PartieDecriptionState createState() => _PartieDecriptionState();
}

class _PartieDecriptionState extends State<PartieDecription> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / 411;
    double ffem = fem * 0.97;

    String description =
        'WebIcônes Personne Téléchargement 1192 Icônes Personne gratuit Icônes de tous et pour tous, trouver l\'icône dont vous avez besoin, enregistrez vos favoris et téléchargez gratuitement ...';

    String trimmedDescription = description.substring(0, 100);
    // ignore: unused_local_variable
    String remainingDescription =
        description.substring(100, description.length);

    return Container(
      margin: EdgeInsets.fromLTRB(22 * fem, 0 * fem, 0 * fem, 15 * fem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 13 * fem),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2575 * ffem / fem,
                  color: Color(0xff969696),
                ),
                children: [
                  TextSpan(
                    text: 'Description : ',
                    style: TextStyle(
                      fontSize: 24 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2575 * ffem / fem,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 352 * fem,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  showFullDescription ? description : trimmedDescription,
                  style: TextStyle(
                    fontSize: 15 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.2575 * ffem / fem,
                    color: Color(0xff969696),
                  ),
                ),
                if (!showFullDescription)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showFullDescription = true;
                      });
                    },
                    child: Text(
                      'Voir plus',
                      style: TextStyle(
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.2575 * ffem / fem,
                        color: Color(0xfff6b970),
                      ),
                    ),
                  ),
                if (showFullDescription)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showFullDescription = false;
                      });
                    },
                    child: Text(
                      'Voir moins',
                      style: TextStyle(
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.2575 * ffem / fem,
                        color: Color(0xfff6b970),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
