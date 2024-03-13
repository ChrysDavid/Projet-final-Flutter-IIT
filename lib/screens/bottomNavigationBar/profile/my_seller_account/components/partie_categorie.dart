import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:jj_vr/constants.dart';
import 'package:jj_vr/models/Categorie_provider.dart';
import 'package:jj_vr/screens/bottomNavigationBar/profile/my_seller_account/Groupe_Cathegorie/category_page.dart';

class PartieCategorie extends StatefulWidget {
  const PartieCategorie({Key? key});

  @override
  _PartieCategorieState createState() => _PartieCategorieState();
}

class _PartieCategorieState extends State<PartieCategorie> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, _) {
        final categories = categoryProvider.categories;

        return Container(
          margin: EdgeInsets.fromLTRB(24 * fem, 0, 0, 33 * fem),
          width: 695 * fem,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Les catégories :',
                style: TextStyle(
                  fontSize: 24 * ffem,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 23 * fem),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < categories.length; i++)
                      _buildCategoryContainer(
                        context,
                        categoryProvider,
                        categories[i],
                        fem,
                        ffem,
                      ),
                    SizedBox(width: 18 * fem),
                    _buildAddCategoryButton(context, categoryProvider, fem),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryContainer(
    BuildContext context,
    CategoryProvider categoryProvider,
    Category category,
    double fem,
    double ffem,
  ) {
    return InkWell(
      onTap: () => _navigateToCategoryPage(category),
      child: Container(
        margin: EdgeInsets.only(right: 18 * fem),
        height: 120 * fem,
        width: 225 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23 * fem),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: FileImage(File(category.imageAssetPath)),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 13 * fem,
                vertical: 13 * fem,
              ),
              child: Text(
                category.categoryName,
                style: TextStyle(
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2575,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () =>
                      _editCategory(context, categoryProvider, category),
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      _deleteCategory(context, categoryProvider, category),
                  icon: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddCategoryButton(
    BuildContext context,
    CategoryProvider categoryProvider,
    double fem,
  ) {
    return Center(
      child: Container(
        width: 150 * fem,
        height: 150 * fem,
        child: IconButton(
          onPressed: () => _addCategory(context, categoryProvider),
          icon: Icon(
            Icons.add_circle_outline,
            color: kPrimaryColor,
            size: 100 * fem,
          ),
        ),
      ),
    );
  }

  void _navigateToCategoryPage(
    Category category,
  ) {
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    final products = categoryProvider.getCategoryProducts(category.id);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(
          category: category,
          products: products,
        ),
      ),
    );
  }

  void _addCategory(
    BuildContext context,
    CategoryProvider categoryProvider,
  ) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final imagePath = image.path;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          String categoryName = '';

          return AlertDialog(
            title: const Text('Ajouter une catégorie'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  categoryName = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Nom de la catégorie',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (categoryName.isNotEmpty) {
                    final newCategory = Category(
                      imageAssetPath: imagePath,
                      categoryName: categoryName,
                      id: categoryProvider.categories.length + 1,
                    );
                    categoryProvider.addCategory(newCategory);
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Ajouter'),
              ),
            ],
          );
        },
      );
    }
  }

  void _editCategory(
    BuildContext context,
    CategoryProvider categoryProvider,
    Category category,
  ) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final imagePath = image.path;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          String updatedCategoryName = category.categoryName;
          return AlertDialog(
            title: Text('Modifier la catégorie'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  updatedCategoryName = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Nom de la catégorie',
              ),
              controller: TextEditingController(text: category.categoryName),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (updatedCategoryName.isNotEmpty) {
                    final updatedCategory = Category(
                      imageAssetPath: imagePath,
                      categoryName: updatedCategoryName,
                      id: category.id,
                      products: category.products,
                    );
                    categoryProvider.updateCategory(updatedCategory);
                  }

                  Navigator.of(context).pop();
                },
                child: const Text('Modifier'),
              ),
            ],
          );
        },
      );
    }
  }

  void _deleteCategory(
    BuildContext context,
    CategoryProvider categoryProvider,
    Category category,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Supprimer la catégorie'),
          content: const Text(
              'Êtes-vous sûr de vouloir supprimer cette catégorie ?'),
          actions: [
            TextButton(
              onPressed: () {
                categoryProvider.deleteCategory(category);
                Navigator.of(context).pop();
              },
              child: Text('Supprimer'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler'),
            ),
          ],
        );
      },
    );
  }
}
