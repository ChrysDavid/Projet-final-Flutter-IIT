import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jj_vr/constants.dart';
import 'package:jj_vr/screens/inscription/sign_in/sign_in_screen.dart';
import 'package:jj_vr/size_config.dart';

import '../components/splash_content.dart';
import '../../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to JJ-VR, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people connect with stores \naround the United States of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  Timer? timer; // Timer pour le défilement automatique

  @override
  void initState() {
    super.initState();
    // Démarrer le défilement automatique après un court délai
    Timer(Duration(milliseconds: 500), startAutoScroll);
  }

  @override
  void dispose() {
    // Arrêter le timer et libérer le PageController lorsque l'écran est supprimé
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  void startAutoScroll() {
    const duration = Duration(seconds: 3);
    timer = Timer.periodic(duration, (Timer timer) {
      if (currentPage < splashData.length - 1) {
        currentPage++;
      } else {
        currentPage =
            0; // Revenir à la première page après avoir atteint la dernière page
      }
      pageController.animateToPage(
        currentPage,
        duration: kAnimationDuration,
        curve: Curves.ease,
      );
    });
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"]!,
                  text: splashData[index]['text']!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
