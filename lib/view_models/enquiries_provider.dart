import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/enquiry.dart';

class EnquiriesProvider with ChangeNotifier {
  List<Enquiry> _enquiries = [];

  get enquiries => _enquiries;

  fetchAndSetData() {
    _enquiries = ENQUIRIES;
  }

  selectEnquiry(String id) {
    Enquiry enq = _enquiries.firstWhere((e) => e.id == id);
    if (enq.isSelected == true) {
      enq.isSelected = false;
    } else {
      enq.isSelected = true;
    }
    notifyListeners();
  }

  selectAll() {
    _enquiries.forEach((enq) {
      enq.isSelected = true;
    });
    notifyListeners();
  }

  deselectAll() {
    _enquiries.forEach((enq) {
      enq.isSelected = false;
    });
    notifyListeners();
  }
}
