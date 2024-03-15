import 'package:flutter/material.dart';
import 'package:my_udyog_admin/views/dashboard/utils/main_screen.dart';

import 'utils/export.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            SizedBox(
              height: 32,
              width: 32,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(
              width: 16,
            ),
            const Text('My Udyog'),
          ],
        ),
        centerTitle: false,
      ),
      body: const Row(
        children: [
          NavRail(),
          Expanded(
            flex: 4,
            child: MainScreen(),
          ),
        ],
      ),
    );
  }
}
