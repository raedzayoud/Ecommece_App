import 'package:ecommerce_app/controller/archive_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/order/cartorderarchives.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Archives extends StatelessWidget {
  const Archives({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Archives"),
          centerTitle: true,
        ),
        body: Container(
            color: AppColor.white,
            child: GetBuilder<ArchiveController>(
                builder: (conttoller) => Handlingdataview(
                      statusRequest: conttoller.statusRequest,
                      widget: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          color: AppColor.white,
                          child: ListView.builder(
                              itemCount: conttoller.dataorders.length,
                              itemBuilder: (context, index) {
                                return Cartorderarchives(
                                    ordermodel: conttoller.dataorders[index]);
                              })),
                    ))));
  }
}
