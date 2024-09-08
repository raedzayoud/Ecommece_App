import 'package:ecommerce_app/controller/productdetails_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class Imagewithcontainer extends GetView<ProductdetailsControllerImp> {
  const Imagewithcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(color: AppColor.secondcolor),
        ),
        Positioned(
          top: 10,
          // right: MediaQuery.of(context).size.width/2,
          left: MediaQuery.of(context).size.width / 10,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: HashCachedImage(
              imageUrl: AppLinkApi.imagesItems +
                  "/" +
                  controller.itemsModel.itemsImage!,
              width: 300,
              height: 300,
            ),
          ),
        ),
      ],
    );
  }
}
