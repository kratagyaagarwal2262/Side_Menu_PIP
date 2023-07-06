import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_menu_app/model/dashboard_model.dart';

class TaskDetailCard extends StatefulWidget {
  final String? subText;
  final MenuItems taskItems;

  const TaskDetailCard({
    this.subText,
    super.key,
    required this.taskItems,
  });

  @override
  State<TaskDetailCard> createState() => _TaskDetailCardState();
}

class _TaskDetailCardState extends State<TaskDetailCard> {
  Color getTextColor(String status) {
    switch (status) {
      case "In Progress":
        return Colors.yellow;
      case "Completed":
        return Colors.green;
      case "Pending":
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  String returnDateDifferenceAge() {
    String difference = "";
    var leadDetails = widget.taskItems.meetingDate;
    difference = leadDetails != null
        ? hoursBetween(DateTime.parse(leadDetails),
                    DateTime.parse(DateTime.now().toString())) <
                24
            ? "${hoursBetween(DateTime.parse(leadDetails), DateTime.parse(DateTime.now().toString())).toString()} hrs"
            : "${daysBetween(DateTime.parse(leadDetails), DateTime.parse(DateTime.now().toString())).toString()} days"
        : hoursBetween(DateTime.parse(leadDetails!),
                    DateTime.parse(DateTime.now().toString())) <
                24
            ? "${hoursBetween(DateTime.parse(leadDetails), DateTime.parse(DateTime.now().toString())).toString()} hrs"
            : "${hoursBetween(DateTime.parse(leadDetails), DateTime.parse(DateTime.now().toString())).toString()} days";
    return difference;
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inDays).round();
  }

  int hoursBetween(DateTime from, DateTime to) {
    var enfr = to.difference(from);
    var difference = (to.difference(from).inHours).round();
    return difference;
  }

  int minutesBetween(DateTime from, DateTime to) {
    '${from.difference(to).inMinutes} minutes';
    var difference = (to.difference(from).inMinutes / 60).round();
    return difference;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    MediaQuery.of(context).orientation == Orientation.portrait;
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0.sp, right: 0.sp, bottom: 12.sp),
          child: Container(
            height: 152.h,
            width: mediaQuery.size.width - 32,
            padding: EdgeInsets.only(bottom: 12.sp),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1.w,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.sp))),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 16.sp, top: 5.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.taskItems.name!,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.sp),
                          child: Icon(
                            Icons.more_vert_sharp,
                            size: 25.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.taskItems.id!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        const Text("|"),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          widget.taskItems.city!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      children: [
                        Icon(
                          size: 14.sp,
                          Icons.contact_page_sharp,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Lead Age: ${widget.taskItems.age!}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          size: 14.sp,
                          Icons.access_time_filled_rounded,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Flexible(
                          child: Text(
                            "Last Activity: ${widget.taskItems.hoursAgo}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    //third row
                    Row(
                      children: [
                        Icon(
                          size: 14.sp,
                          Icons.calendar_month_outlined,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Flexible(
                          child: Text(
                            returnDateDifferenceAge(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 26.sp,
                          padding: EdgeInsets.symmetric(horizontal: 10.sp),
                          decoration: BoxDecoration(
                            color: getTextColor(widget.taskItems.orderStatus!)
                                .withOpacity(0.15),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.sp),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              widget.taskItems.orderStatus!,
                              style: TextStyle(
                                color:
                                    getTextColor(widget.taskItems.orderStatus!),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 16.sp),
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.call,
                              size: 25.sp,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
