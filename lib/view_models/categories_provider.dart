import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/category.dart';

class CategoriesProvider with ChangeNotifier {
  List<Category> _categories = [];

  get categories => _categories;

  fetchAndSetCategories() {
    _categories = CATEGORIES;
  }

  addCategory() {}

  editCategory() {}

  selectCategory(String id) {
    Category cat = _categories.firstWhere((c) => c.categoryId == id);
    if (cat.isSelected == true) {
      cat.isSelected = false;
    } else {
      cat.isSelected = true;
    }
    notifyListeners();
  }

  selectAll() {
    _categories.forEach((cat) {
      cat.isSelected = true;
    });
    notifyListeners();
  }

  deselectAll() {
    _categories.forEach((cat) {
      cat.isSelected = false;
    });
    notifyListeners();
  }
}
