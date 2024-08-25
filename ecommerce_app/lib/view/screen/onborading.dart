import 'package:ecommerce_app/controller/onboradingcontroller.dart';
import 'package:ecommerce_app/view/widget/onborading/custombutton.dart';
import 'package:ecommerce_app/view/widget/onborading/customdotonborading.dart';
import 'package:ecommerce_app/view/widget/onborading/customslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onborading extends StatelessWidget {
  const Onborading({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboradingcontrollerImp());
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: SafeArea(
                  child:CustomsliderOnborading(),)),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Customdotonborading(),
                    Spacer(),
                    CustombuttonOnborading(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
