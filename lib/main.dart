import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jj_vr/models/Categorie_provider.dart';
import 'package:jj_vr/routes.dart';
import 'package:jj_vr/screens/welcome/splash/splash_screen.dart';
import 'package:jj_vr/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        // home: SplashScreen(),
        // We use routeName so that we dont need to remember the name
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }

  static void setTheme(ThemeData darkTheme) {}
}
