import 'package:flutter/material.dart';

class NavProvider with ChangeNotifier {
  String _selectedTitle = 'Dashboard';
  int _selectedDropIndex = -1;
  List<String> _dropData = [
    'Categories',
    'Commodities',
    'Grades',
  ];

  Map<String, bool> _isDrop = {
    'Data Management': false,
    'Reports': false,
  };

  List<String> _dropReports = [
    'Enquiries',
    'Purchase Orders',
    'Invoices',
  ];

  get selectedTitle => _selectedTitle;
  get selectedDropIndex => _selectedDropIndex;

  set selectedTitle(value) {
    _selectedTitle = value;
    notifyListeners();
  }

  set selectedDropIndex(value) {
    _selectedDropIndex = value;
    notifyListeners();
  }

  getDropList(title) {
    if (title == 'Data Management') {
      return _dropData;
    }
    return _dropReports;
  }

  getIsDrop(title) {
    return _isDrop[title];
  }

  setIsDrop(title) {
    if (_isDrop[title] == true) {
      _isDrop[title] = false;
    } else {
      _isDrop[title] = true;
    }
    print('isDrop');
    notifyListeners();
  }
}
