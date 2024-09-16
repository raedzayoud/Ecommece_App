import 'package:ecommerce_app/controller/homescrren_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/home/curstombuttomapparhome.dart';
import 'package:ecommerce_app/view/widget/home/custombuttomappar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScrrenControllerImp());
    return GetBuilder<HomeScrrenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.white,
                onPressed: () {
                  controller.GoTocart();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Icon(Icons.shopping_basket_outlined),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: Curstombuttomapparhome(),
              body: controller.list.elementAt(controller.currentindex),
            ));
  }
}
