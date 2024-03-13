import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jj_vr/models/Product.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
          child: Text(
            "\$${widget.product.price}",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              fontWeight: FontWeight.w600,
              color: kPrimaryColor,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 42 * fem),
                width: 141 * fem,
                height: 34 * fem,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Action à effectuer lors du clic sur le bouton Chat
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    onPrimary: Color(0xff000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10 * fem),
                    ),
                  ),
                  icon: Icon(
                    Icons.chat,
                    size: 24 * ffem,
                  ),
                  label: Text(
                    'Chat',
                    style: TextStyle(
                      fontSize: 24 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2575 * ffem,
                    ),
                  ),
                ),
              ),
              Container(
                width: 181 * fem,
                height: 34 * fem,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Action à effectuer lors du clic sur le bouton Share profil
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    onPrimary: Color(0xff000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10 * fem),
                    ),
                  ),
                  icon: Icon(
                    Icons.share,
                    size: 24 * ffem,
                  ),
                  label: Text(
                    'Share profil',
                    style: TextStyle(
                      fontSize: 24 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2575 * ffem,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color: widget.product.isFavourite
                  ? Color(0xFFFFE6E6)
                  : Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.product.isFavourite = !widget.product.isFavourite;
                });
              },
              child: SvgPicture.asset(
                "assets/icons/Heart Icon_2.svg",
                color: widget.product.isFavourite
                    ? Color(0xFFFF4848)
                    : Color(0xFFDBDEE4),
                height: getProportionateScreenWidth(16),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            widget.product.description,
            maxLines: showFullDescription ? null : 3,
          ),
        ),
        if (!showFullDescription)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: 10,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showFullDescription = true;
                });
              },
              child: Row(
                children: [
                  Text(
                    "See More Detail",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        if (showFullDescription)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: 10,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showFullDescription = false;
                });
              },
              child: Row(
                children: [
                  Text(
                    "See Less Detail",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
