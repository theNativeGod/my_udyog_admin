import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/blog.dart';

class BlogsProvider with ChangeNotifier {
  List<Blog> _blogs = [];
  get blogs => _blogs;

  fetchAndSetData() {
    _blogs = BLOGS;
  }

  selectBlog(String id) {
    Blog blg = _blogs.firstWhere((c) => c.article == id);
    if (blg.isSelected == true) {
      blg.isSelected = false;
    } else {
      blg.isSelected = true;
    }
    notifyListeners();
  }

  selectAll() {
    _blogs.forEach((blg) {
      blg.isSelected = true;
    });
    notifyListeners();
  }

  deselectAll() {
    _blogs.forEach((blg) {
      blg.isSelected = false;
    });
    notifyListeners();
  }
}
