import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String categoryId;
  String categoryName;
  final DateTime createdDate;
  DateTime modifiedDate;
  bool status;
  bool isSelected;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.createdDate,
    required this.modifiedDate,
    required this.status,
    this.isSelected = false,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'],
      categoryName: json['name'],
      createdDate: json['created_at'].toDate(),
      modifiedDate: json['modified_at'].toDate(),
      status: json['status'],
      isSelected: false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.categoryName;
    data['created_at'] = Timestamp.fromDate(this.createdDate);
    data['modified_at'] = Timestamp.fromDate(this.modifiedDate);
    data['status'] = this.status;

    return data;
  }
}
