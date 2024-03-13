import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jj_vr/constants.dart';
import 'package:jj_vr/models/Categorie_provider.dart';
import 'package:jj_vr/models/Product.dart';
import 'package:jj_vr/screens/bottomNavigationBar/profile/my_seller_account/Groupe_Cathegorie/create_produit.dart';
import 'package:jj_vr/size_config.dart';

class CategoryPage extends StatefulWidget {
  final Category category;
  final List<Product> products;

  const CategoryPage({
    Key? key,
    required this.category,
    required this.products,
  }) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    products = widget.products;
  }

  Future<void> _navigateToCreateProduct(Product? product) async {
    final createdProduct = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CreateProduct(product: product, onDelete: _deleteProduct),
      ),
    );

    if (createdProduct != null) {
      setState(() {
        if (product != null) {
          // Remplacer le produit existant par le produit modifié
          final index = products.indexOf(product);
          products[index] = createdProduct;
        } else {
          // Ajouter le nouveau produit à la liste
          products.add(createdProduct);
        }
      });
    }
  }

  void _deleteProduct(Product product) {
    setState(() {
      products.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.categoryName),
      ),
      body: products.isEmpty
          ? Center(
              child: Text(
                'No products available for ${widget.category.categoryName}',
              ),
            )
          : Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: getProportionateScreenWidth(20),
                  mainAxisSpacing: getProportionateScreenWidth(20),
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    _navigateToCreateProduct(products[index]);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.02,
                        child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(20)),
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Hero(
                            tag: products[index].id.toString(),
                            child: Image.file(File(products[index].images[0])),
                          ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenWidth(10)),
                      Text(
                        products[index].title,
                        style: TextStyle(color: Colors.black),
                        maxLines: 2,
                      ),
                      SizedBox(height: getProportionateScreenWidth(10)),
                      Text(
                        products[index].price.toString() + ' F cfa',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          _navigateToCreateProduct(null);
        },
        icon: Icon(Icons.add),
        label: Text(
          'Add Product',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
