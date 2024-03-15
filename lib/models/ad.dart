class Ad {
  String adTitle;
  String category;
  String startDate;
  String endDate;
  String status;
  bool isSelected;
  Ad({
    required this.adTitle,
    required this.category,
    required this.startDate,
    required this.endDate,
    required this.status,
    this.isSelected = false,
  });
}

List<Ad> ADS = [
  Ad(
    adTitle: 'Ad 1 Plan Upgrade',
    category: 'Plan',
    startDate: '20/11/2023',
    endDate: '31/12/2023',
    status: 'Active',
  ),
  Ad(
    adTitle: 'Ad 2 Plan Upgrade',
    category: 'Plan',
    startDate: '20/11/2023',
    endDate: '31/12/2023',
    status: 'Scheduled',
  ),
  Ad(
    adTitle: 'Ad 3 Plan Upgrade',
    category: 'Plan',
    startDate: '20/11/2023',
    endDate: '31/12/2023',
    status: 'Inactive',
  ),
  Ad(
    adTitle: 'Ad 4 Plan Upgrade',
    category: 'Plan',
    startDate: '20/11/2023',
    endDate: '31/12/2023',
    status: 'Draft',
  ),
  Ad(
    adTitle: 'Ad 5 Plan Upgrade',
    category: 'Plan',
    startDate: '20/11/2023',
    endDate: '31/12/2023',
    status: 'Active',
  ),
];
