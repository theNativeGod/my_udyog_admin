import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/category.dart';

class CategoriesProvider with ChangeNotifier {
  List<Category> _categories = [];
  bool _isLoading = false;

  get categories => _categories;
  get isLoading => _isLoading;

  fetchAndSetCategories() async {
    _isLoading = true;
    notifyListeners();
    var result = await FirebaseFirestore.instance.collection('category').get();

    List<Category> cats = [];
    result.docs.forEach((doc) {
      cats.add(Category.fromJson(doc.data()));
    });
    _categories = cats;
    _isLoading = false;
    notifyListeners();
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
