import 'package:ecommerce_app/controller/favourite_controller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/view/widget/customappar.dart';
import 'package:ecommerce_app/view/widget/items/customlistitemsgrid.dart';
import 'package:ecommerce_app/view/widget/items/listitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemscategories extends StatelessWidget {
  const Itemscategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavouriteControllerImp favouriteControllerImp=Get.put(FavouriteControllerImp());

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColor.white,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Customappar(
                titleappar: "Find Your Product ",
                onPressedIcon: () {},
                onPressedSearch: () {},
              ),
              const SizedBox(height: 10),
              Listitems(),
              Expanded(
                child: GetBuilder<ItemsControllerImp>(
                  builder: (controller) => Handlingdataview(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                      itemCount: controller.data.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.55,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        favouriteControllerImp.isfavorite[controller.data[index]['items_id']]="${controller.data[index]['favourite']}";
                        return Customlistitemsgrid(
                          itemsModel:
                              ItemsModel.fromJson(controller.data[index])
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
