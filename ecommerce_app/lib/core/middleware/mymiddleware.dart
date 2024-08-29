import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices services=Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if(services.sharedPreferences.getBool("onborading")==true){
      return RouteSettings(name: AppRoutes.login);
    }
  }
}
