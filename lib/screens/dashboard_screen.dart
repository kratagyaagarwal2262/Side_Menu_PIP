import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:side_menu_app/components/grid_view.dart';
import 'package:side_menu_app/components/sc_serch_box.dart';
import 'package:side_menu_app/provider/sc_provider.dart';

import '../components/task_detail_card.dart';
import '../main.dart';
import '../model/dashboard_model.dart';

class DashboardScreen extends StatelessWidget {
  final List<Screens> screens;
  final String screenType;
  const DashboardScreen(
      {super.key, required this.screens, required this.screenType});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ScProvider(),
        ),
      ],
      child: WillPopScope(
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
          body: SingleChildScrollView(
            child: Column(
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
                SizedBox(
                  height: 20.sp,
                ),
                SizedBox(
                  height: 100.sp,
                  child: const SearchLeadBox(),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7.sp),
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: screens[2].menuItems!.length,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 7.sp),
                            child: TaskDetailCard(
                              taskItems: screens[2].menuItems![index],
                              subText: "Follow Up Call",
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
