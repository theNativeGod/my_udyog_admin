class Commodity {
  String id;
  String name;
  String category;
  String createdDate;
  String modifiedDate;
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
}

List<Commodity> COMMODITIES = [
  Commodity(
    id: '2244499811',
    name: 'Wheat',
    category: 'Grains',
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
  Commodity(
    id: '2244499812',
    name: 'Red Gram',
    category: 'Pulses',
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
  Commodity(
    id: '2244499812',
    name: 'Red Gram',
    category: 'Pulses',
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
  Commodity(
    id: '2244499812',
    name: 'Red Gram',
    category: 'Pulses',
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
  Commodity(
    id: '2244499811',
    name: 'Wheat',
    category: 'Grains',
    createdDate: '08/10/2000',
    modifiedDate: '08/10/2000',
    status: true,
  ),
];
