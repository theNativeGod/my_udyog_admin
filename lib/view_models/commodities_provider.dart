import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/commodity.dart';

class CommoditiesProvider with ChangeNotifier {
  List<Commodity> _commodities = [];

  get commodities => _commodities;

  fetchAndSetData() {
    _commodities = COMMODITIES;
  }

  selectCommodity(String id) {
    Commodity com = _commodities.firstWhere((c) => c.id == id);
    if (com.isSelected == true) {
      com.isSelected = false;
    } else {
      com.isSelected = true;
    }
    notifyListeners();
  }

  selectAll() {
    _commodities.forEach((com) {
      com.isSelected = true;
    });
    notifyListeners();
  }

  deselectAll() {
    _commodities.forEach((com) {
      com.isSelected = false;
    });
    notifyListeners();
  }
}
