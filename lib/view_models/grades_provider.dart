import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/grade.dart';

class GradesProvider with ChangeNotifier {
  List<Grade> _grades = [];

  get grades => _grades;

  fetchAndSetData() {
    _grades = GRADES;
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
