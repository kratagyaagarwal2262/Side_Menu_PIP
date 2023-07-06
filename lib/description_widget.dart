import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_menu_app/screens/bottom_menu.dart';
import 'package:side_menu_app/screens/dashboard_screen.dart';
import 'package:side_menu_app/screens/exception_screen.dart';
import 'package:side_menu_app/model/dashboard_model.dart';
import 'package:side_menu_app/screens/side_menu.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description Widget'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300.sp,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 2.sp,
                  ),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: TextField(
                    maxLines: 15,
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Description',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.sp),
              TextButton(
                child: const Text('Generate Response'),
                onPressed: () {
                  bool isJson = isJsonValid(_textEditingController.text);
                  if (!isJson) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExceptionScreen(),
                      ),
                    );
                  } else {
                    Map<String, dynamic> jsonData =
                        json.decode(_textEditingController.text);
                    var realJson = Dashboard.fromJson(jsonData);
                    if (realJson.screenType == "forceField") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(
                            screens: realJson.screens!,
                            screenType: realJson.screenType!,
                          ),
                        ),
                      );
                    } else if (jsonData['menuType'] == "sideMenu") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SideMenu(jsonString: _textEditingController.text),
                        ),
                      );
                    } else if (jsonData['menuType'] == "bottomMenu") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomMenu(
                              jsonString: _textEditingController.text),
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  bool isJsonValid(String jsonString) {
    try {
      json.decode(jsonString);
      return true;
    } catch (e) {
      return false;
    }
  }
}
