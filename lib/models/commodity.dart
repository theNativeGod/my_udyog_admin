import 'package:cloud_firestore/cloud_firestore.dart';

class Commodity {
  String id;
  String name;
  String category;
  DateTime createdDate;
  DateTime modifiedDate;
  bool status;
  bool isSelected;

  Commodity({
    required this.id,
    required this.name,
    required this.category,
    required this.createdDate,
    required this.modifiedDate,
    required this.status,
    this.isSelected = false,
  });

  factory Commodity.fromJson(Map<String, dynamic> json) {
    return Commodity(
      id: json['commodity_id'],
      name: json['name'],
      category: json['category_id'],
      createdDate: json['created_at'].toDate(),
      modifiedDate: json['modified_at'].toDate(),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commodity_id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.category;
    data['created_at'] = Timestamp.fromDate(this.createdDate);
    data['modified_at'] = Timestamp.fromDate(this.modifiedDate);
    data['status'] = this.status;
    return data;
  }
}
