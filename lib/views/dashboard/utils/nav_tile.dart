import 'package:flutter/material.dart';
import 'package:my_udyog_admin/view_models/main_screen_provider.dart';
import 'package:my_udyog_admin/view_models/nav_provider.dart';
import 'package:provider/provider.dart';

class NavTile extends StatelessWidget {
  const NavTile({
    required this.icon,
    required this.title,
    this.isDropExist,
    super.key,
  });

  final String icon;
  final bool? isDropExist;
  final String title;

  @override
  Widget build(BuildContext context) {
    var navProvider = Provider.of<NavProvider>(context);
    var mainScreenProvider = Provider.of<MainScreenProvider>(context);
    String selectedTitle = navProvider.selectedTitle;
    List<String> dropList = navProvider.getDropList(title);
    bool isDrop = isDropExist == true ? navProvider.getIsDrop(title) : false;
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              navProvider.selectedDropIndex = -1;

              navProvider.selectedTitle = title;
              if (isDropExist == true) {
                navProvider.setIsDrop(title);
              } else {
                mainScreenProvider.selectedScreen = title;
              }
            },
            tileColor:
                selectedTitle == title ? const Color(0xff1A387A) : Colors.transparent,
            hoverColor: Colors.white10,
            leading: SizedBox(
              height: 20,
              child: Image.asset(
                'assets/images/$icon.png',
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: selectedTitle == title ? Colors.amber : Colors.white,
                  ),
            ),
            trailing: isDropExist == true
                ? isDrop && selectedTitle == title
                    ? const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.amber,
                      )
                    : Icon(
                        Icons.keyboard_arrow_down,
                        color: selectedTitle == title
                            ? Colors.amber
                            : Colors.white,
                      )
                : null,
          ),
          isDropExist == true && isDrop && selectedTitle == title
              ? Container(
                  width: double.infinity,
                  color: Color(0xff152E65),
                  child: Material(
                    type: MaterialType.transparency,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) {
                          return ListTile(
                            tileColor: navProvider.selectedDropIndex == i
                                ? const Color(0xff10234C)
                                : Colors.transparent,
                            onTap: () {
                              navProvider.selectedDropIndex = i;
                              mainScreenProvider.selectedScreen = dropList[i];
                            },
                            title: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 36.0),
                              child: Text(
                                dropList[i],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: navProvider.selectedDropIndex == i
                                          ? Colors.amber
                                          : Colors.white,
                                    ),
                              ),
                            ),
                          );
                        },
                        itemCount: dropList.length),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}
