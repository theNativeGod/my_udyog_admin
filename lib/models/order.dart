class Order {
  String id;
  String poId;
  String poFrom;
  String poTo;
  String date;
  String state;
  String city;
  String poStatus;
  bool isSelected;

  Order({
    required this.id,
    required this.poId,
    required this.poFrom,
    required this.poTo,
    required this.date,
    required this.state,
    required this.city,
    required this.poStatus,
    this.isSelected = false,
  });
}

List<Order> ORDERS = [
  Order(
    id: '123456781',
    poId: '123456789',
    poFrom: 'Rahul Enterprices',
    poTo: 'Nischay Enterprices',
    date: '08/10/2000',
    state: 'Bihar',
    city: 'Gaya',
    poStatus: 'Accepted',
  ),
  Order(
    id: '123456782',
    poId: '123456789',
    poFrom: 'Rahul Enterprices',
    poTo: 'Nischay Enterprices',
    date: '08/10/2000',
    state: 'Bihar',
    city: 'Gaya',
    poStatus: 'Accepted',
  ),
  Order(
    id: '123456783',
    poId: '123456789',
    poFrom: 'Rahul Enterprices',
    poTo: 'Nischay Enterprices',
    date: '08/10/2000',
    state: 'Bihar',
    city: 'Gaya',
    poStatus: 'Rejected',
  ),
  Order(
    id: '123456784',
    poId: '123456789',
    poFrom: 'Rahul Enterprices',
    poTo: 'Nischay Enterprices',
    date: '08/10/2000',
    state: 'Bihar',
    city: 'Gaya',
    poStatus: 'Accepted',
  ),
];
