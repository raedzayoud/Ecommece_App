import 'package:ecommerce_app/controller/productdetails_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductdetailsControllerImp controllerImp =
        Get.put(ProductdetailsControllerImp());
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(40)),
                      color: AppColor.secondcolor),
                ),
                Positioned(
                  top: 20,
                  // right: MediaQuery.of(context).size.width/2,
                   left: MediaQuery.of(context).size.width/10,
                   child: Hero(
                    tag: "${controllerImp.itemsModel.itemsId}",
                     child: HashCachedImage(
                        imageUrl: AppLinkApi.imagesItems +
                            "/" +
                            controllerImp.itemsModel.itemsImage!,width: 300,height: 300,),
                   ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
