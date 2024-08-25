import 'package:ecommerce_app/controller/onboradingcontroller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomsliderOnborading extends GetView<OnboradingcontrollerImp> {
  const CustomsliderOnborading({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.controller,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onboradingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Image.asset(
                  onboradingList[i].image!,
                  width: 200,
                  height: 250,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "${onboradingList[i].title}",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    onboradingList[i].body!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ));
  }
}
