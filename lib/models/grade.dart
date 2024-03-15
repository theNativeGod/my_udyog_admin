class Grade {
  String id;
  String name;
  List<String> commodities;
  String createdDate;
  String modifiedDate;
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
}

List<Grade> GRADES = [
  Grade(
    id: '3344776761',
    name: 'A1',
    commodities: [
      'Rice',
      'Wheat',
      'green gram',
      'Mon',
    ],
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
  Grade(
    id: '3344776762',
    name: 'A2',
    commodities: ['Mon', 'Mon', 'Mon', 'Mon'],
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
  Grade(
    id: '3344776762',
    name: 'A2',
    commodities: ['Mon', 'Mon', 'Mon', 'Mon'],
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
  Grade(
    id: '3344776762',
    name: 'A2',
    commodities: ['Mon', 'Mon', 'Mon', 'Mon'],
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
];
