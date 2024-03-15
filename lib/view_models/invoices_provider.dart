import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/invoice.dart';

class InvoicesProvider with ChangeNotifier {
  List<Invoice> _invoices = [];

  get invoices => _invoices;

  fetchAndSetData() {
    _invoices = INVOICES;
  }

  selectInvoice(String id) {
    Invoice inv = _invoices.firstWhere((e) => e.invoiceId == id);
    if (inv.isSelected == true) {
      inv.isSelected = false;
    } else {
      inv.isSelected = true;
    }
    notifyListeners();
  }

  selectAll() {
    _invoices.forEach((inv) {
      inv.isSelected = true;
    });
    notifyListeners();
  }

  deselectAll() {
    _invoices.forEach((inv) {
      inv.isSelected = false;
    });
    notifyListeners();
  }
}
