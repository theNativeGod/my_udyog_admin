import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/commodity.dart';

class CommoditiesProvider with ChangeNotifier {
  List<Commodity> _commodities = [];
  bool _isLoading = false;

  get commodities => _commodities;
  get isLoading => _isLoading;

  fetchAndSetData() async {
    _isLoading = true;
    notifyListeners();
    var result = await FirebaseFirestore.instance
        .collection('commodities')
        .orderBy('commodity_id')
        .get();

    List<Commodity> coms = [];

    coms = await Future.wait(result.docs.map((doc) async {
      Commodity com = Commodity.fromJson(doc.data());
      var res = await FirebaseFirestore.instance
          .collection('category')
          .where('category_id', isEqualTo: com.category)
          .get();
      
      com.category = res.docs.first.data()['name'];
      print(com.category);
      return com;
    }).toList());
    _commodities = coms;
    _isLoading = false;
    notifyListeners();
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
