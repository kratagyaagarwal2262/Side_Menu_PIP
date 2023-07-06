import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/sc_provider.dart';

class SearchLeadBox extends StatelessWidget {
  const SearchLeadBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Leads',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                "(${context.watch<ScProvider>().totalAmount})",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.swap_vert,
                      color: Colors.grey,
                      size: 25.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.filter_alt,
                      color: Colors.grey,
                      size: 25.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.sp,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.sp),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(
                5.sp,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10.sp),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
