import 'package:ecommerce_app/binding.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/view/screen/onborading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
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
        headlineMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 25,color: AppColor.black),
        bodyLarge: TextStyle(height: 2, color: AppColor.grey),
      )
      ),
      initialBinding: MyBinding(),
      //routes: routes,
      getPages: getPages, 
    );
  }
}


