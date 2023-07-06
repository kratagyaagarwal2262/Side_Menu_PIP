import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:side_menu_app/model/dashboard_model.dart';
import 'package:side_menu_app/provider/sc_provider.dart';

class GridScreen extends StatelessWidget {
  final List<MenuItems> gridItems;

  const GridScreen({super.key, required this.gridItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: GridView.count(
          childAspectRatio: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          crossAxisCount: 2,
          children: gridItems.map((item) {
            context.read<ScProvider>().changeTotalAmount(item.count!);
            return SizedBox(
              child: Padding(
                padding: EdgeInsets.all(6.sp),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: const Color.fromRGBO(226, 231, 239, 1),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(left: 15.sp),
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.29),
                            height: 40.h,
                            child: Container(
                              width: 40.w,
                              height: 40.h,
                              padding: EdgeInsets.all(9.sp),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(242, 244, 248, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.network(
                                item.icon!,
                                color: const Color.fromRGBO(0, 189, 255, 1),
                                height: 20.sp,
                                width: 20.sp,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 50.h,
                            margin: EdgeInsets.only(left: 15.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.count.toString(),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  item.name!,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color:
                                        const Color.fromRGBO(99, 106, 117, 1),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
