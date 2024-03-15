import 'package:flutter/material.dart';

import '../views/dashboard/utils/export.dart';

class MainScreenProvider with ChangeNotifier {
  String _selectedScreen = 'Dashboard';

  get selectedScreen => _selectedScreen;

  get title {
    print(_selectedScreen);
    switch (_selectedScreen) {
      case 'Categories':
        return MainScreenTitle(
          title: 'Data Management',
          subTitle: ' / Categories',
        );
      case 'Commodities':
        return MainScreenTitle(
          title: 'Data Management',
          subTitle: ' / Commodities',
        );
      case 'Grades':
        return MainScreenTitle(
          title: 'Data Management',
          subTitle: ' / Grades',
        );
      case 'Enquiries':
        return MainScreenTitle(
          title: 'Reports',
          subTitle: ' / $_selectedScreen',
        );
      case 'Purchase Orders':
        return MainScreenTitle(
          title: 'Reports',
          subTitle: ' / $_selectedScreen',
        );
      case 'Invoices':
        return MainScreenTitle(
          title: 'Reports',
          subTitle: ' / $_selectedScreen',
        );
    }

    return MainScreenTitle(
      title: _selectedScreen,
      subTitle: '',
    );
  }

  set selectedScreen(value) {
    _selectedScreen = value;
    notifyListeners();
  }
}
