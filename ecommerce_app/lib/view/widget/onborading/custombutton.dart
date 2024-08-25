import 'package:ecommerce_app/controller/onboradingcontroller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustombuttonOnborading extends GetView<OnboradingcontrollerImp> {
  const CustombuttonOnborading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      margin: EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        onPressed: () {
          controller.next();
        },
        child: Text(
          "Continue",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: AppColor.primaycolor,
      ),
    );
  }
}
