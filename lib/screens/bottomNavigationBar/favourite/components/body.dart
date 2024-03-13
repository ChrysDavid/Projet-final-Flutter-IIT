import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jj_vr/constants.dart';
import 'package:jj_vr/models/Product.dart';
import 'package:jj_vr/screens/autre_page/details/details_screen.dart';
import 'package:jj_vr/size_config.dart';

class Body extends StatefulWidget {
  final List<Product> favoritedProduct;
  const Body({Key? key, required this.favoritedProduct}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return widget.favoritedProduct.isEmpty
        ? Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/images/favorited.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Your favorited Product',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
            height: size.height * 0.5,
            child: ListView.builder(
              itemCount: widget.favoritedProduct.length,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(widget.favoritedProduct[index].id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        widget.favoritedProduct.removeAt(index);
                      });
                    },
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: ListTile(
                      onTap: () => Navigator.pushNamed(
                        context,
                        DetailsScreen.routeName,
                        arguments: ProductDetailsArguments(
                          product: widget.favoritedProduct[index],
                        ),
                      ),
                      leading: SizedBox(
                        width: 88,
                        child: AspectRatio(
                          aspectRatio: 0.88,
                          child: Container(
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(10)),
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F6F9),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                                widget.favoritedProduct[index].images[0]),
                          ),
                        ),
                      ),
                      title: Text(widget.favoritedProduct[index].title),
                      subtitle: Text(
                        "\$${widget.favoritedProduct[index].price.toString()}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
