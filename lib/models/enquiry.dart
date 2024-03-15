class Enquiry {
  String id;
  String enquiryFrom;
  String enquiryTo;
  String date;
  String commodity;
  String packing;
  String state;
  String city;
  String enquiryStatus;
  bool isSelected;

  Enquiry({
    required this.id,
    required this.enquiryFrom,
    required this.enquiryTo,
    required this.date,
    required this.commodity,
    required this.packing,
    required this.state,
    required this.city,
    required this.enquiryStatus,
    this.isSelected = false,
  });
}

List<Enquiry> ENQUIRIES = [
  Enquiry(
    id: '123456781',
    enquiryFrom: 'Rahul Enterprices',
    enquiryTo: 'Nischay Enterprices',
    date: '08/10/2000',
    commodity: 'Tamarind',
    packing: 'Yes',
    state: 'Bihar',
    city: 'Gaya',
    enquiryStatus: 'Addressed',
  ),
  Enquiry(
    id: '123456782',
    enquiryFrom: 'Rahul Enterprices',
    enquiryTo: 'Nischay Enterprices',
    date: '08/10/2000',
    commodity: 'Tamarind',
    packing: 'Yes',
    state: 'Bihar',
    city: 'Gaya',
    enquiryStatus: 'Not Addressed',
  ),
  Enquiry(
    id: '123456783',
    enquiryFrom: 'Rahul Enterprices',
    enquiryTo: 'Nischay Enterprices',
    date: '08/10/2000',
    commodity: 'Tamarind',
    packing: 'Yes',
    state: 'Bihar',
    city: 'Gaya',
    enquiryStatus: 'Not Addressed',
  ),
  Enquiry(
    id: '123456784',
    enquiryFrom: 'Rahul Enterprices',
    enquiryTo: 'Nischay Enterprices',
    date: '08/10/2000',
    commodity: 'Tamarind',
    packing: 'Yes',
    state: 'Bihar',
    city: 'Gaya',
    enquiryStatus: 'Addressed',
  ),
  Enquiry(
    id: '123456785',
    enquiryFrom: 'Rahul Enterprices',
    enquiryTo: 'Nischay Enterprices',
    date: '08/10/2000',
    commodity: 'Tamarind',
    packing: 'Yes',
    state: 'Bihar',
    city: 'Gaya',
    enquiryStatus: 'Addressed',
  ),
];
