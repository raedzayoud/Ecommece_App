import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/view/screen/onborading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,color: AppColor.black),
        bodyLarge: TextStyle(height: 2, color: AppColor.grey)
      )
      ),
      home: Onborading(),
      routes: routes,
    );
  }
}


