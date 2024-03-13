import 'package:flutter/material.dart';
import 'package:jj_vr/constants.dart';
import 'package:jj_vr/models/Cart.dart';
import 'package:jj_vr/screens/autre_page/details/details_screen.dart';
import 'package:jj_vr/size_config.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  bool isAddedToCart = false;

  @override
  void initState() {
    super.initState();
    // Vérifier si l'élément est déjà dans le panier
    isAddedToCart = demoCarts.contains(widget.cart);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        DetailsScreen.routeName,
        arguments: ProductDetailsArguments(product: widget.cart.product),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(widget.cart.product.images[0]),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cart.product.title,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$${widget.cart.product.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                      text: " x${widget.cart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          if (!isAddedToCart)
            IconButton(
              onPressed: () {
                // Ajouter l'élément au panier uniquement s'il n'est pas déjà présent
                if (!demoCarts.contains(widget.cart)) {
                  setState(() {
                    demoCarts.add(widget.cart);
                    isAddedToCart = true;
                  });
                }
              },
              icon: Icon(Icons.shopping_cart),
            ),
        ],
      ),
    );
  }
}
