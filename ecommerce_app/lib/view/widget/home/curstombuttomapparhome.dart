import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/controller/homescrren_controller.dart';
import 'package:ecommerce_app/view/widget/home/custombuttomappar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Curstombuttomapparhome extends GetView<HomeScrrenControllerImp> {
  const Curstombuttomapparhome({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Allows horizontal scrolling
        child: Row(
          children: [
            ...List.generate(controller.list.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? Container(
                      width: 10,
                    )
                  : Custombuttomappar(
                      textappar: controller.mp.keys.elementAt(i),
                      iconData: controller.mp[controller.mp.keys.elementAt(i)]!,
                      color: controller.changeColor(controller.currentindex, i),
                      onPressed: () {
                        controller.changePage(i);
                      },
                    );
            }),
          ],
        ),
      ),
    );
  }
}
