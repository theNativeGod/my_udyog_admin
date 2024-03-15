import 'package:flutter/material.dart';
import '../models/customer.dart';

class CustomerProvider with ChangeNotifier {
  List<Customer> _customers = [];

  get customers => _customers;

  fetchAndSetData() {
    _customers = CUSTOMERS;
  }
   selectCustomer(String id) {
    Customer cus = _customers.firstWhere((c) => c.id == id);
    if (cus.isSelected == true) {
      cus.isSelected = false;
    } else {
      cus.isSelected = true;
    }
    notifyListeners();
  }

  selectAll() {
    _customers.forEach((cus) {
      cus.isSelected = true;
    });
    notifyListeners();
  }

  deselectAll() {
    _customers.forEach((cus) {
      cus.isSelected = false;
    });
    notifyListeners();
  }
}
