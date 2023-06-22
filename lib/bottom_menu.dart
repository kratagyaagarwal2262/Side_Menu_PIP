import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:side_menu_app/exception.dart';

import 'common.dart';
import 'model/side_menu_model.dart';

class BottomMenu extends StatefulWidget {
  final String jsonString;

  const BottomMenu({super.key, required this.jsonString});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    try {
      Map<String, dynamic> jsonData = json.decode(widget.jsonString);
      String menuType = jsonData['menuType'];
      SideMenuModel response = SideMenuModel.fromJson(jsonData);
      return Scaffold(
        appBar: AppBar(
          title: Text(
            menuType.toUpperCase(),
          ),
        ),
        body: commonButton(context),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: List.generate(
            response.menuItems!.length,
            (index) {
              var menuItems = response.menuItems!;
              try {
                return BottomNavigationBarItem(
                  icon: menuItems[index].icon == null
                      ? const Icon(Icons.error)
                      : Icon(getIconForName(menuItems[index].icon!)),
                  label: menuItems[index].menu,
                  backgroundColor: Color(int.parse(
                          menuItems[index].color!.substring(1, 7),
                          radix: 16) +
                      0xFF000000),
                );
              } catch (e) {
                return const BottomNavigationBarItem(
                  icon: Icon(Icons.error),
                  label: "Invalid Data in json",
                  backgroundColor: Colors.red,
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
