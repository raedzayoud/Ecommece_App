import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Listtopsellings extends GetView<HomepageControllerImp> {
  const Listtopsellings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.itemstopsellings.length,
          itemBuilder: (context, index) {
            return Items(itemsModel: ItemsModel.fromJson(controller.itemstopsellings[index]) ,);
          }),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(
                    "${AppLinkApi.imagesItems}/${itemsModel.itemsImage}",
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 150,
                  width: 190,
                  decoration: BoxDecoration(
                      color: AppColor.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                    left: 15,
                    top: 10,
                    child: Text(
                      "${itemsModel.itemsName}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))
              ],
            );
  }
}
