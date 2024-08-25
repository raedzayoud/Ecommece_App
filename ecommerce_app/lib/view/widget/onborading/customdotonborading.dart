import 'package:ecommerce_app/controller/onboradingcontroller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customdotonborading extends StatelessWidget {
  const Customdotonborading({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboradingcontrollerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onboradingList.length,
                    (index) => AnimatedContainer(
                          margin: EdgeInsets.only(right: 10),
                          duration: Duration(milliseconds: 900),
                          width: controller.currentPage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: AppColor.primaycolor,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
