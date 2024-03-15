import 'package:flutter/material.dart';

import 'export.dart';

class NavRail extends StatelessWidget {
  const NavRail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        color: const Color(0xff1F4393),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              NavTile(
                icon: 'dashboard_icon',
                title: 'Dashboard',
              ),
              NavTile(
                icon: 'data_icon',
                title: 'Data Management',
                isDropExist: true,
              ),
              NavTile(
                icon: 'subscription',
                title: 'Subscription Management',
              ),
              NavTile(
                icon: 'customers',
                title: 'Customers',
              ),
              NavTile(
                icon: 'reports',
                title: 'Reports',
                isDropExist: true,
              ),
              NavTile(
                icon: 'blog',
                title: 'Blogs',
              ),
              NavTile(
                icon: 'ads',
                title: 'Ads Management',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
