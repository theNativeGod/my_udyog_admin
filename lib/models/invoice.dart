class Invoice {
  String orderId;
  String invoiceId;
  String from;
  String to;
  String date;
  String state;
  String city;
  String status;
  bool isSelected;
  Invoice({
    required this.orderId,
    required this.invoiceId,
    required this.from,
    required this.to,
    required this.date,
    required this.state,
    required this.city,
    required this.status,
    this.isSelected = false,
  });
}

List<Invoice> INVOICES = [
  Invoice(
    orderId: '123456781',
    invoiceId: '123456781',
    from: 'Rahul Enterprices',
    to: 'Nischay Enterprices',
    date: '08/10/2000',
    state: 'Bihar',
    city: 'Gaya',
    status: 'Generated',
  ),
  Invoice(
    orderId: '123456782',
    invoiceId: '123456782',
    from: 'Rahul Enterprices',
    to: 'Nischay Enterprices',
    date: '08/10/2000',
    state: 'Bihar',
    city: 'Gaya',
    status: 'Generated',
  ),
  Invoice(
    orderId: '123456783',
    invoiceId: '123456783',
    from: 'Rahul Enterprices',
    to: 'Nischay Enterprices',
    date: '08/10/2000',
    state: 'Bihar',
    city: 'Gaya',
    status: 'Generated',
  ),
  Invoice(
    orderId: '123456784',
    invoiceId: '123456784',
    from: 'Rahul Enterprices',
    to: 'Nischay Enterprices',
    date: '08/10/2000',
    state: 'Bihar',
    city: 'Gaya',
    status: 'Generated',
  ),
  Invoice(
    orderId: '123456785',
    invoiceId: '123456785',
    from: 'Rahul Enterprices',
    to: 'Nischay Enterprices',
    date: '08/10/2000',
    state: 'Bihar',
    city: 'Gaya',
    status: 'Generated',
  ),
];
