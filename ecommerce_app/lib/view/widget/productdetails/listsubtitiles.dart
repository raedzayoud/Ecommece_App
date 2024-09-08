import 'package:ecommerce_app/controller/productdetails_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Listsubtitiles extends GetView<ProductdetailsControllerImp> {
  const Listsubtitiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.Produits.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            width: 90,
            height: 70,
            decoration: BoxDecoration(
                color: controller.Produits[index]['active'] == "1"
                    ? AppColor.secondcolor
                    : null,
                border: Border.all(
                    color: controller.Produits[index]['active'] == "1"
                        ? AppColor.secondcolor
                        : AppColor.black),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "${controller.Produits[index]['name']}",
              style: TextStyle(
                  color: controller.Produits[index]['active'] == "1"
                      ? AppColor.white
                      : AppColor.black),
            ),
          ),
        ),
      ],
    );
  }
}
