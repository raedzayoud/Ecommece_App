import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/controller/productdetails_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/screen/home.dart';
import 'package:ecommerce_app/view/screen/notifications.dart';
import 'package:ecommerce_app/view/screen/offers.dart';
import 'package:ecommerce_app/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomescrrenController extends GetxController {
  changePage(int index);
  changeColor(int index, int current);
}

class HomeScrrenControllerImp extends HomescrrenController {
  int currentindex = 0;
  Color color = Colors.black;
  //ProductdetailsControllerImp ProductcontrollerImp=Get.put(ProductdetailsControllerImp());
  //CartControllerImp cartControllerImp = Get.put(CartControllerImp());

  Map<String, IconData> mp = {
    "home": Icons.home,
    "notification": Icons.notifications_active_outlined,
    "Profile": Icons.person_pin_sharp,
    "Settings": Icons.settings,
  };
  List<Widget> list = [
    Home(),
    Notifications(),
    Offers(),
    Settings(),
  ];

  GoTocart() {
 //   cartControllerImp.refreshPage();
    Get.toNamed(AppRoutes.cart);
  }

  @override
  changePage(int index) {
    currentindex = index;
    update();
  }

  @override
  changeColor(int index, int current) {
    return index == current ? AppColor.primaycolor : AppColor.black;
  }
}
