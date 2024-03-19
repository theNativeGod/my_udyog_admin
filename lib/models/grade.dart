import 'package:cloud_firestore/cloud_firestore.dart';

class Grade {
  String id;
  String name;
  List<String> commodities;
  DateTime createdDate;
  DateTime modifiedDate;
  bool status;
  bool isSelected;

  Grade({
    required this.id,
    required this.name,
    required this.commodities,
    required this.createdDate,
    required this.modifiedDate,
    required this.status,
    this.isSelected = false,
  });

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      id: json['grade_id'],
      name: json['name'],
      commodities: [
        'Rice',
        'Wheat',
        'green gram',
        'Mon',
      ],
      createdDate: json['created_at'].toDate(),
      modifiedDate: json['modified_at'].toDate(),
      status: true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'grade_id': id,
      'name': name,
      'commodities': commodities,
      'created_at': Timestamp.fromDate(this.createdDate),
      'modified_at': Timestamp.fromDate(this.modifiedDate),
      'status': status,
    };
  }
}
