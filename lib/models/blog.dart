class Blog {
  String article;
  String category;
  String pageViews;
  String status;
  bool isSelected;

  Blog({
    required this.article,
    required this.category,
    required this.pageViews,
    required this.status,
    this.isSelected = false,
  });
}

List<Blog> BLOGS = [
  Blog(
    article: 'Tips & Tricks of Farming',
    category: 'Farming',
    pageViews: '100k',
    status: 'Published',
  ),
  Blog(
    article: 'Tips & Tricks of Farming1',
    category: 'Farming',
    pageViews: '100k',
    status: 'Unpublished',
  ),
  Blog(
    article: 'Tips & Tricks of Farming2',
    category: 'Farming',
    pageViews: '100k',
    status: 'Archive',
  ),
];
