import 'package:flutter/material.dart';
import 'package:jj_vr/models/Product.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  void addCategory(Category category) {
    _categories.add(category);
    notifyListeners();
  }

  void updateCategory(Category updatedCategory) {
    final index =
        _categories.indexWhere((category) => category.id == updatedCategory.id);
    if (index != -1) {
      _categories[index] = updatedCategory;
      notifyListeners();
    }
  }

  List<Product> getCategoryProducts(int categoryId) {
    final category = _categories.firstWhere((cat) => cat.id == categoryId);
    return category.products;
  }

  void deleteCategory(Category category) {
    _categories.removeWhere((cat) => cat.id == category.id);
    notifyListeners();
  }
}

class Category {
  final int id;
  final String imageAssetPath;
  final String categoryName;
  final List<Product> products;

  Category({
    required this.imageAssetPath,
    required this.categoryName,
    required this.id,
    List<Product>? products,
  }) : this.products = products ?? [];

  bool hasProduct(Product product) {
    return products.contains(product);
  }
}
