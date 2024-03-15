import 'package:flutter/material.dart';
import 'package:my_udyog_admin/view_models/ads_provider.dart';
import 'package:my_udyog_admin/view_models/blogs_provider.dart';
import 'package:my_udyog_admin/view_models/categories_provider.dart';
import 'package:my_udyog_admin/view_models/commodities_provider.dart';
import 'package:my_udyog_admin/view_models/customer_provider.dart';
import 'package:my_udyog_admin/view_models/enquiries_provider.dart';
import 'package:my_udyog_admin/view_models/grades_provider.dart';
import 'package:my_udyog_admin/view_models/invoices_provider.dart';
import 'package:my_udyog_admin/view_models/main_screen_provider.dart';
import 'package:my_udyog_admin/view_models/nav_provider.dart';
import 'package:my_udyog_admin/view_models/orders_provider.dart';
import 'package:my_udyog_admin/view_models/table_provider.dart';
import 'package:my_udyog_admin/views/dashboard/admin_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => NavProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MainScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TableProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CommoditiesProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => GradesProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CustomerProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => EnquiriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrdersProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => InvoicesProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => BlogsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AdsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffFAFBFC),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        home: AdminScreen(),
      ),
    );
  }
}
