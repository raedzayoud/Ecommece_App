import 'package:ecommerce_app/controller/productdetails_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:ecommerce_app/view/widget/productdetails/bodytext.dart';
import 'package:ecommerce_app/view/widget/productdetails/imagewithcontainer.dart';
import 'package:ecommerce_app/view/widget/productdetails/listsubtitiles.dart';
import 'package:ecommerce_app/view/widget/productdetails/quantityandprice.dart';
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
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.secondcolor,
          borderRadius: BorderRadius.circular(
              10), // Match the border radius with the button
        ),
        height: 50,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(40), // Circular shape for the button
          ),
          onPressed: () {},
          child: Text(
            "Add To Cart",
            style: TextStyle(
              color: AppColor.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Imagewithcontainer(),
            SizedBox(
              height: 105,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Bodytext(
                    body: "${controllerImp.itemsModel.itemsName}",
                    color: AppColor.primaycolor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Bodytext(
                    body:
                        "${controllerImp.itemsModel.itemsDesc}${controllerImp.itemsModel.itemsDesc}${controllerImp.itemsModel.itemsDesc}",
                    color: AppColor.black,
                    size: 15.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Bodytext(
                    body: "Color",
                    color: AppColor.primaycolor,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Listsubtitiles(),
                  SizedBox(
                    height: 10,
                  ),
                  Quantityandprice(
                    price: "${controllerImp.itemsModel.itemsPrice}",
                    quantity: "${controllerImp.itemsModel.itemsCount}",
                    onAdd: () {
                      controllerImp.cartControllerImp
                          .addCart("${controllerImp.itemsModel.itemsId}");
                    },
                    onRemove: () {
                      controllerImp.cartControllerImp
                          .removeCart("${controllerImp.itemsModel.itemsId}");
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
