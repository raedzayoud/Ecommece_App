import 'package:ecommerce_app/controller/myfavourite_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/customappar.dart';
import 'package:ecommerce_app/view/widget/myfavourite/customlistitemsfavourite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Myfavourite extends StatelessWidget {
  const Myfavourite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyfavouriteControllerImp());
    return Scaffold(
      body: Container(
          color: AppColor.white,
          padding: EdgeInsets.all(10),
          child: GetBuilder<MyfavouriteControllerImp>(
       //     id: 'favouriteList',
            builder: (controller) => ListView(
              children: [
                // Customappar(
                //   titleappar: "Find Product ",
                //   onPressedIcon: () {},
                //   onPressedSearch: () {},
                //   onPressedFavourite: () {},
                // ),
                SizedBox(
                  height: 20,
                ),
                Handlingdataview(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.56),
                        itemCount: controller.allData.length,
                        itemBuilder: (context, index) {
                          return Customlistitemsfavourite(
                              itemsModel: controller.allData[index]);
                        })),
              ],
            ),
          )),
    );
  }
}
