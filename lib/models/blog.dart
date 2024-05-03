import 'dart:convert';

class Blog {
  String title;
  String image;
  String description;
  String blogs_id;
  DateTime created_at;
  int? pageViews;
  String? status;
  bool? recommended;
  bool isSelected;

  Blog({
    required this.title,
    required this.image,
    required this.description,
    required this.blogs_id,
    required this.created_at,
    required this.pageViews,
    required this.status,
    required this.recommended,
    this.isSelected = false,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        title: json['title'],
        image: json['image'],
        description: json['description'],
        blogs_id: json['blogs_id'],
        created_at: json['created_at'].toDate(),
        pageViews: json['page_viewss'] ?? 0,
        status: json['status'],
        recommended: json['recommended'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'image': image,
        'description': description,
        'blogs_id': blogs_id,
        'created_at': created_at.toIso8601String(),
        'page_views': pageViews,
        'status': status,
        'recommended': recommended,
      };

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
