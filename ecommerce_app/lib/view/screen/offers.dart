import 'package:ecommerce_app/controller/offers_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/items/customlistitemsgrid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/controller/favourite_controller.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    FavouriteControllerImp favouriteControllerImp =
        Get.put(FavouriteControllerImp());

    return Scaffold(
        appBar: AppBar(
          title: Text("Offers"),
        ),
        body: GetBuilder<OffersController>(
          builder: (controller) => Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.dataItems.length,
                  itemBuilder: (context, index) {
                    return Customlistitemsgrid(
                        itemsModel: controller.dataItems[index]);
                  })),
        ));
  }
}
