import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/ad.dart';

class AdsProvider with ChangeNotifier {
  List<Ad> _ads = [];

  get ads => _ads;

  fetchAndSetData() {
    _ads = ADS;
  }

  selectAd(String id) {
    Ad ad = _ads.firstWhere((c) => c.adTitle == id);
    if (ad.isSelected == true) {
      ad.isSelected = false;
    } else {
      ad.isSelected = true;
    }
    notifyListeners();
  }

  selectAll() {
    _ads.forEach((ad) {
      ad.isSelected = true;
    });
    notifyListeners();
  }

  deselectAll() {
    _ads.forEach((ad) {
      ad.isSelected = false;
    });
    notifyListeners();
  }
}
