import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/model/categoriesmodel.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Listitems extends GetView<ItemsControllerImp> {
  const Listitems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double
          .infinity, // Ensures the container takes the full width available
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(width: 20), // Adds spacing between items
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Items(
            itemsModel: ItemsModel.fromJson(controller.categories[index]),
            i: index,
          );
        },
      ),
    );
  }
}

class Items extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  final int i;

  const Items({super.key, required this.itemsModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(builder: (controller)=>InkWell(
      onTap: () {
        // controller.goToItems(controller.categories, i);
        controller.changeitem(i,itemsModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 10),
            decoration: controller.selectCat == i
                ? BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: AppColor.primaycolor, width: 3)),
                  )
                : null,
            child: Text(
              "${itemsModel.categoriesName}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.grey2),
            ),
          ),
        ],
      ),
    ));
  }
}
