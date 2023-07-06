import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_menu_app/components/grid_view.dart';

import '../main.dart';
import '../model/dashboard_model.dart';

class DashboardScreen extends StatelessWidget {
  final List<Screens> screens;
  final String screenType;
  const DashboardScreen(
      {super.key, required this.screens, required this.screenType});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyApp(),
          ),
        );
        return false;
      },
      child: Scaffold(
        appBar: screenType == "forceField"
            ? appBarForSc(context, screens[1].menuItems!)
            : AppBar(
                title: const Text(
                  "SC DashboardScreen",
                ),
              ),
        body: Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            screens[0].menuType == "gridItems"
                ? SizedBox(
                    height: 180.sp,
                    child: GridScreen(
                      gridItems: screens[0].menuItems!,
                    ),
                  )
                : invalidGrid(context),
          ],
        ),
      ),
    );
  }
}

Widget invalidGrid(BuildContext context) {
  return SizedBox(
    height: 100.sp,
    child: Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyApp(),
            ),
          );
        },
        child: const Text(
          "Invalid Json Grid Data",
          style: TextStyle(color: Colors.red),
        ),
      ),
    ),
  );
}

AppBar appBarForSc(BuildContext context, List<MenuItems> appBarData) {
  return AppBar(
    elevation: 0.5,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          appBarData[0].frontIcon!,
          color: const Color.fromRGBO(0, 189, 255, 1),
          width: 30.sp,
          height: 30.sp,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appBarData[0].name!,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),
            Text(
              appBarData[0].email!,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Icon(
          Icons.notifications,
          color: const Color.fromRGBO(150, 150, 150, 0.9),
          size: 25.sp,
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(right: 3.sp),
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(150, 150, 150, 0.9),
              backgroundImage: NetworkImage(appBarData[0].profileImageUrl!),
              radius: 15.sp,
            ),
          ),
        ),
      ],
    ),
  );
}
