import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/domain/weather.dart';
import 'package:weather/precentation/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: splash(),
      ),
      designSize: Size(392, 781),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    // required this.data,
    super.key,
  });
  // final Weather data;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TextEditingController mycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
