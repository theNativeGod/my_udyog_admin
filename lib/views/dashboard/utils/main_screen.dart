import 'package:flutter/material.dart';
import 'package:my_udyog_admin/view_models/main_screen_provider.dart';
import 'package:my_udyog_admin/view_models/table_provider.dart';
import 'package:my_udyog_admin/views/add_blog_section.dart';
import 'package:my_udyog_admin/views/tables/ads/ads.dart';
import 'package:my_udyog_admin/views/tables/blogs/blogs.dart';
import 'package:my_udyog_admin/views/tables/categories/categories_table.dart';
import 'package:my_udyog_admin/views/tables/commodities/commodities.dart';
import 'package:my_udyog_admin/views/tables/customer/customer_table.dart';
import 'package:my_udyog_admin/views/tables/enquiries/enquiries.dart';
import 'package:my_udyog_admin/views/tables/grades/grades.dart';
import 'package:my_udyog_admin/views/tables/invoices/invoices.dart';
import 'package:my_udyog_admin/views/tables/purchase_orders/orders.dart';
import 'package:provider/provider.dart';

import '../../../view_models/nav_provider.dart';
import 'export.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  fetchAndSetData() {}

  @override
  Widget build(BuildContext context) {
    var mainScreenProvider = Provider.of<MainScreenProvider>(context);
    var navProvider = Provider.of<NavProvider>(context);
    Widget TitleWidget = mainScreenProvider.title;
    var tableProvider = Provider.of<TableProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget,
              const SizedBox(
                height: 16,
              ),
              getTable(mainScreenProvider.selectedScreen),
            ],
          ),
        ),
      ),
    );
  }

  getTable(title) {
    switch (title) {
      case 'Categories':
        return CategoriesTable();
      case 'Commodities':
        return CommoditiesTable();
      case 'Grades':
        return GradesTable();
      case 'Customers':
        return CustomerTable();
      case 'Enquiries':
        return EnquiriesTable();
      case 'Purchase Orders':
        return PurchaseOrdersTable();
      case 'Invoices':
        return InvoicesTable();
      case 'Blogs':
        return BlogsTable();
      case 'Ads Management':
        return AdsTable();
      case 'Add Blog':
        return AddBlogSection();
      default:
        return Text(title);
    }
  }
}
