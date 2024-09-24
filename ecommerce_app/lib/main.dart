import 'package:ecommerce_app/binding.dart';
import 'package:ecommerce_app/controller/locale_controller.dart';
import 'package:ecommerce_app/core/constant/apptheme.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData, // Use the themeData here
      initialBinding: MyBinding(),
      getPages: getPages, // Ensure routes are correctly imported
    );
  }
}
