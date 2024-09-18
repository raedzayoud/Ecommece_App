import 'package:ecommerce_app/controller/settings_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Adressview extends StatelessWidget {
  const Adressview({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controllerImp = Get.put(SettingsControllerImp());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
             Get.toNamed(AppRoutes.addaddress);
          },
          child: Icon(
            Icons.add,
            color: AppColor.white,
          ),
          backgroundColor: AppColor.primaycolor),
      appBar: AppBar(
        backgroundColor: AppColor.primaycolor,
        title: Text(
          "Address",
          style: TextStyle(color: AppColor.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.white),
          onPressed: () {
            controllerImp.goToSettings();
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
