import 'package:flutter/material.dart';

import '../models/order.dart';

class OrdersProvider with ChangeNotifier {
  List<Order> _orders = [];

  get orders => _orders;

  fetchAndSetData() {
    _orders = ORDERS;
  }

  selectOrder(String id) {
    Order ord = _orders.firstWhere((e) => e.id == id);
    if (ord.isSelected == true) {
      ord.isSelected = false;
    } else {
      ord.isSelected = true;
    }
    notifyListeners();
  }

  selectAll() {
    _orders.forEach((ord) {
      ord.isSelected = true;
    });
    notifyListeners();
  }

  deselectAll() {
    _orders.forEach((ord) {
      ord.isSelected = false;
    });
    notifyListeners();
  }
}
