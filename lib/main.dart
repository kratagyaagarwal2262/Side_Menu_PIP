import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'description_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace this JSON string with your actual JSON data

    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Side Menu App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const DescriptionWidget(),
        );
      },
    );
  }
}

class DescriptionWidget extends StatefulWidget {
  const DescriptionWidget({super.key});

  @override
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return const Description();
  }
}
