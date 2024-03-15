class Category {
  String categoryId;
  String categoryName;
  final String createdDate;
  String modifiedDate;
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
}

List<Category> CATEGORIES = [
  Category(
    categoryId: '121223211',
    categoryName: 'Pulses',
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
  Category(
    categoryId: '121223212',
    categoryName: 'Cereals',
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
  Category(
    categoryId: '121223213',
    categoryName: 'Cereals',
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
  Category(
    categoryId: '121223214',
    categoryName: 'Cereals',
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
  Category(
    categoryId: '121223215',
    categoryName: 'Cereals',
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
];
