import 'package:flutter/material.dart';

import 'main.dart';

Widget exceptionWidget(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Exception Occured'),
      backgroundColor: Colors.red,
    ),
    body: Center(
      child: TextButton(
        child: const Text(
            'At least Pass a valid JSON . Click me To enter Proper Value',
            style: TextStyle(color: Colors.red)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyApp(),
            ),
          );
        },
      ),
    ),
  );
}
