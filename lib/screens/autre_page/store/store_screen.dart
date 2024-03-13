import 'package:flutter/material.dart';
import 'package:jj_vr/screens/autre_page/store/components/Partie_web_site.dart';
import 'package:jj_vr/screens/autre_page/store/components/partie_categorie.dart';
import 'package:jj_vr/screens/autre_page/store/components/partie_description.dart';
import 'package:jj_vr/screens/autre_page/store/components/partie_image.dart';
import 'package:jj_vr/screens/autre_page/store/components/partie_socio.dart';
import 'package:jj_vr/screens/autre_page/store/components/partie_avis.dart';

class StoreScreen extends StatelessWidget {
  static String routeName = "/store";
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PartieImage(),
            PartieCategorie(),
            PartieDecription(),
            PartieSiteWeb(),
            PartieSocio(),
            RatingWidget(),
          ],
        ),
      ),
    );
  }
}
