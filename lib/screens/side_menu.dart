import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_menu_app/model/side_menu_model.dart';

import '../common.dart';
import '../exception.dart';

class SideMenu extends StatelessWidget {
  final String jsonString;

  const SideMenu({super.key, required this.jsonString});

  @override
  Widget build(BuildContext context) {
    try {
      Map<String, dynamic> jsonData = json.decode(jsonString);
      String menuType = jsonData['menuType'];
      SideMenuModel response = SideMenuModel.fromJson(jsonData);
      //  List<dynamic> menuItems = jsonData['menuItems'];

      return Scaffold(
        appBar: AppBar(
          title: Text(response.menuType!.toUpperCase()),
        ),
        body: commonButton(context),
        drawer: Drawer(
          child: ListView.builder(
            itemCount: response.menuItems!.length,
            itemBuilder: (context, index) {
              var menuItems = response.menuItems![index];
              try {
                Color color = Color(
                    int.parse(menuItems.color!.substring(1, 7), radix: 16) +
                        0xFF000000);
                return ListTile(
                  title: Text(menuItems.menu!),
                  leading: Icon(getIconForName(menuItems.icon!)),
                  textColor: color,
                  iconColor: color,
                  onTap: () {
                    Navigator.pop(context);
                  },
                );
              } catch (e) {
                return SizedBox(
                  height: 40.sp,
                  child: Text(
                    "Enter proper Field / Key",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      );
    } catch (e) {
      return exceptionWidget(context);
    }
  }
}
