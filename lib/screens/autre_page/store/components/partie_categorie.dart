import 'package:flutter/material.dart';

class PartieCategorie extends StatelessWidget {
  const PartieCategorie({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / 411;
    double ffem = fem * 0.97;
    return Container(
      margin: EdgeInsets.fromLTRB(24 * fem, 0 * fem, 0 * fem, 33 * fem),
      width: 695 * fem,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 23 * fem),
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
                    text: 'Les catégories :',
                    style: TextStyle(
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.2575 * ffem / fem,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Action when Vêtements enfants is clicked
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          18 * fem, 8 * fem, 36 * fem, 8 * fem),
                      height: 106 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23 * fem),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/vetements-enfant-1-bg.png',
                          ),
                        ),
                      ),
                      child: Text(
                        'Vêtements enfants',
                        style: TextStyle(
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.2575 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 18 * fem,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Action when Vêtements Hommes is clicked
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 2 * fem),
                      padding: EdgeInsets.fromLTRB(
                          13 * fem, 10 * fem, 13 * fem, 10 * fem),
                      width: 225 * fem,
                      height: 106 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23 * fem),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/vetement-pour-homme-1-bg.png',
                          ),
                        ),
                      ),
                      child: Text(
                        'Vêtements Hommes',
                        style: TextStyle(
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.2575 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 18 * fem,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Action when Vêtements Femmes is clicked
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          30 * fem, 10 * fem, 31 * fem, 10 * fem),
                      width: 225 * fem,
                      height: 106 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23 * fem),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/oip-1-bg.png',
                          ),
                        ),
                      ),
                      child: Text(
                        'Vêtements Femmes',
                        style: TextStyle(
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.2575 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
