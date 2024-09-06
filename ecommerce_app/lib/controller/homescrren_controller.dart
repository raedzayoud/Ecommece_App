import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomescrrenController extends GetxController {
  changePage(int index);
  changeColor(int index, int current);
}

class HomeScrrenControllerImp extends HomescrrenController {
  int currentindex = 0;
  Color color = Colors.black;
  Map<String,IconData>mp={
    "home":Icons.home,
    "Settings":Icons.settings,
    "Profile":Icons.man,
    "Favourite":Icons.favorite_outline,
  };
  List<Widget> list = [
    Home(),
    Column(
      children: [
        Text("settings"),
      ],
    ),
    Column(
      children: [
        Text("Profile"),
      ],
    ),
    Column(
      children: [
        Text("Favourite"),
      ],
    ),
  ];
  @override
  changePage(int index) {
    currentindex = index;
    update();
  }
  
  @override
  changeColor(int index, int current) {
   return index==current?AppColor.primaycolor:AppColor.black;
  }
}
