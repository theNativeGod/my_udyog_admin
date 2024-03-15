import 'package:flutter/material.dart';

import '../models/export.dart';

class TableProvider with ChangeNotifier {
  List<Category> _categories = [];
  fetchAndSetData() {}
}

final List<String> catheaderTexts = [
  'Category ID',
  'Category Name',
  'Created Date',
  'Modified Date',
  'Status',
  'Edit',
];

final List<String> comHeaderTexts = [
  'Commodity ID',
  'Commodity Name',
  'Category',
  'Created Date',
  'Modified Date',
  'Status',
  'Edit',
];

final List<String> gradeHeaderTexts = [
  'Grade ID',
  'Grade Name',
  'Commodities',
  'Created Date',
  'Modified Date',
  'Status',
  'Edit',
];

final List<String> customerHeaderTexts = [
  'Customer ID',
  'Customer Name',
  'Plan',
  'Joining Date',
  'Customer Type',
  'Company Name',
  'Designation',
  'Employees',
  'Commodities',
];

final List<String> enquiriesHeaderTexts = [
  'Enquiry ID',
  'Enquiry From',
  'Enquiry To',
  'Date',
  'Commodity',
  'Packing',
  'State',
  'City',
  'Enquiry Status',
];

final List<String> purchaseHeaderTexts = [
  'Order ID',
  'PO ID',
  'PO From',
  'PO To',
  'Date',
  'State',
  'City',
  'PO Status',
];

final List<String> invoiceHeaderTexts = [
  'Order ID',
  'Invoice ID',
  'From',
  'To',
  'Date',
  'State',
  'City',
  'Status',
];

final List<String> blogHeaderTexts = [
  'Article',
  'Category',
  'Page Views',
  'Status',
  'Actions',
];

final List<String> adsHeaderTexts = [
  'Ad Title',
  'Category',
  'Start Date',
  'End Date',
  'Status',
  'Actions',
];
