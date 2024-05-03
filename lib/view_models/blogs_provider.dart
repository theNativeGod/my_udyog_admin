import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/blog.dart';

class BlogsProvider with ChangeNotifier {
  List<Blog> _blogs = [];
  bool _isLoading = false;

  get blogs => _blogs;
  get isLoading => _isLoading;

  fetchAndSetData() async {
    _isLoading = true;
    var result = await FirebaseFirestore.instance
        .collection('admin')
        .doc('hS4S365J82OY9pmWw4EB')
        .collection('blogs')
        .orderBy('blogs_id')
        .get();
    List<Blog> blgs = [];
    result.docs.forEach((doc) {
      blgs.add(Blog.fromJson(doc.data()));
    });
    _blogs = blgs;

    _isLoading = false;
    notifyListeners();
  }

  selectBlog(String id) {
    Blog blg = _blogs.firstWhere((c) => c.title == id);
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
