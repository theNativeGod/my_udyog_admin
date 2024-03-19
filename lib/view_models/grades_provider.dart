import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/grade.dart';

class GradesProvider with ChangeNotifier {
  List<Grade> _grades = [];
  bool _isLoading = false;

  get grades => _grades;
  get isLoading => _isLoading;

  fetchAndSetData() async {
    _isLoading = true;
    notifyListeners();
    var result = await FirebaseFirestore.instance
        .collection('grades')
        .orderBy('grade_id')
        .get();

    List<Grade> grds = [];
    result.docs.forEach((doc) {
      grds.add(Grade.fromJson(doc.data()));
    });
    _grades = grds;
    _isLoading = false;
    notifyListeners();
  }

  selectGrade(String id) {
    Grade grd = _grades.firstWhere((c) => c.id == id);
    if (grd.isSelected == true) {
      grd.isSelected = false;
    } else {
      grd.isSelected = true;
    }
    notifyListeners();
  }

  selectAll() {
    _grades.forEach((grd) {
      grd.isSelected = true;
    });
    notifyListeners();
  }

  deselectAll() {
    _grades.forEach((grd) {
      grd.isSelected = false;
    });
    notifyListeners();
  }
}
