import 'package:flutter/material.dart';
import 'package:home_rant/core/constant/color_contant.dart';
import 'package:home_rant/presentation/widgets/drawer_item.dart';

import 'package:home_rant/presentation/widgets/drawer_items.dart';

class DrawerWidget extends StatefulWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  final DrawerItem? selectedItem;
  const DrawerWidget({super.key, required this.onSelectedItem, this.selectedItem});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) =>SingleChildScrollView(
       child:  Column(
      children: [
        buildDrawerItems(context)
      ],
    )
  );

//   Widget buildDrawerItems(BuildContext context) => Column(
  Widget buildDrawerItems(BuildContext context) {
  final List<Widget> drawerList = [];
    for (int i = 0; i < DrawerItems.all.length; i++) {
    if (i == 3 || i == 6) {
      drawerList.add(Divider(
        color: AppColor.whiteColor,
        thickness: 1,
         endIndent: 24,
      ));
    }

    final item = DrawerItems.all[i];
      final isSelected = item == widget.selectedItem;

      if (isSelected) {
        drawerList.add(
          Container(
            height: 40,
            margin: EdgeInsets.only(right: 20, bottom: 8, top: 8),
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: InkWell(
              onTap: () => widget.onSelectedItem(item),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(item.iconPath, color: AppColor.primaryColor, height: 20),
                    SizedBox(width: 12),
                    Text(
                      item.title,
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontFamily: 'Raleway',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        drawerList.add(
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 24),
            leading: Image.asset(item.iconPath, color: Colors.white),
            title: Text(
              item.title,
              style: TextStyle(
                color: AppColor.whiteColor,
                fontFamily: 'Raleway',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () => widget.onSelectedItem(item),
          ),
        );
      }
    }

  return Column(children: drawerList);
}
}






