import 'package:flutter/material.dart';

class PartieSocio extends StatelessWidget {
  const PartieSocio({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / 411;
    double ffem = fem * 0.97;
    return Container(
      margin: EdgeInsets.fromLTRB(19 * fem, 0 * fem, 0 * fem, 35.64 * fem),
      width: 317 * fem,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(3 * fem, 0 * fem, 0 * fem, 14 * fem),
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
                    text: 'Socio : ',
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
            width: double.infinity,
            height: 65.36 * fem,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Ajoutez ici l'action à effectuer lors du clic sur l'icône Instagram
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 64 * fem, 0 * fem),
                      padding: EdgeInsets.fromLTRB(
                          18.67 * fem, 18.67 * fem, 18.67 * fem, 20.03 * fem),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/ellipse-5-Kvc.png'),
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 26.67 * fem,
                          height: 26.67 * fem,
                          child: Image.asset(
                            'assets/images/instagram.png',
                            width: 26.67 * fem,
                            height: 26.67 * fem,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Ajoutez ici l'action à effectuer lors du clic sur l'icône Facebook
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 61 * fem, 0 * fem),
                      padding: EdgeInsets.fromLTRB(
                          25 * fem, 19 * fem, 24.33 * fem, 19.69 * fem),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/ellipse-5-W2Y.png'),
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 14.67 * fem,
                          height: 26.67 * fem,
                          child: Image.asset(
                            'assets/images/facebook.png',
                            width: 14.67 * fem,
                            height: 26.67 * fem,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Ajoutez ici l'action à effectuer lors du clic sur l'icône LinkedIn
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          18.67 * fem, 18.67 * fem, 18.67 * fem, 21.36 * fem),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/ellipse-5.png'),
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 26.67 * fem,
                          height: 25.33 * fem,
                          child: Image.asset(
                            'assets/images/linkedin.png',
                            width: 26.67 * fem,
                            height: 25.33 * fem,
                          ),
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
