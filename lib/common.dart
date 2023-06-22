import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main.dart';

IconData getIconForName(String iconName) {
  switch (iconName) {
    case 'home':
      {
        return Icons.home;
      }

    case 'settings':
      {
        return Icons.settings;
      }

    case 'person':
      {
        return Icons.person;
      }

    default:
      {
        return Icons.abc;
      }
  }
}

Widget commonButton(BuildContext context) {
  return Center(
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyApp(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.sp),
          color: Colors.blue,
        ),
        width: 200.sp,
        height: 50.sp,
        child: Center(
          child: Text(
            "Click Me to Enter Another \n Json",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    ),
  );
}
