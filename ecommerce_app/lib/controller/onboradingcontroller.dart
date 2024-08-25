import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Onboradingcontroller extends GetxController {
  next();
  onPageChanged(int index);
}

class OnboradingcontrollerImp extends Onboradingcontroller {
  int currentPage = 0;
  late PageController controller;

  @override
  next() {
    currentPage++;
    if (currentPage > onboradingList.length-1) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      controller.animateToPage(currentPage,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    controller = PageController();
    super.onInit();
  }
}
