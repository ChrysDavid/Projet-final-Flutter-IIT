import 'package:flutter/material.dart';
import 'package:jj_vr/constants.dart';
import 'package:jj_vr/models/Cart.dart';
import 'package:jj_vr/screens/bottomNavigationBar/home/cart/cart_screen.dart';
import 'package:jj_vr/size_config.dart';

import '../../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  List<Product> selected = Product.getSelectProduct();

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.product.rating),
      ),
      body: Body(product: agrs.product),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Cart cart = Cart(product: agrs.product, numOfItem: 1);
          demoCarts.add(cart);
          Navigator.pushNamed(context, CartScreen.routeName);
        },
        icon: Icon(Icons.shopping_cart),
        label: Text(
          'Add To Cart',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        extendedPadding: EdgeInsets.only(
          left: SizeConfig.screenWidth * 0.15,
          right: SizeConfig.screenWidth * 0.15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
