import 'package:flutter/material.dart';
import 'package:jj_vr/components/coustom_bottom_nav_bar.dart';
import 'package:jj_vr/enums.dart';
import 'package:jj_vr/models/Product.dart';
import '../favourite/components/body.dart';

// ignore: must_be_immutable
class FavoriteScreen extends StatelessWidget {
  List<Product> favorites = Product.getFavoriteProducts();
  static String routeName = "/favourite";
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourite',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false, // Ajoutez cette ligne
      ),
      body: Body(
        favoritedProduct: favorites,
      ),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
