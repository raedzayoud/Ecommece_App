import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/cart/curstomtopappar.dart';
import 'package:ecommerce_app/view/widget/cart/custombuttomcart.dart';
import 'package:ecommerce_app/view/widget/cart/custombuttomnavigatorcart.dart';
import 'package:ecommerce_app/view/widget/cart/customorder.dart';
import 'package:ecommerce_app/view/widget/cart/custompriceshipping.dart';
import 'package:ecommerce_app/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp cartControllerImp= Get.put(CartControllerImp());
    cartControllerImp.refreshPage();
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.white),
            onPressed: () {
              Get.back();
            },
          ),
      ),
        bottomNavigationBar: Custombuttomnavigatorcart(),
        body: GetBuilder<CartControllerImp>(
          builder: (controller) => Handlingdataview(
            statusRequest: controller.statusRequest,
            widget: Container(
              color: AppColor.white,
              child: ListView(
                children: [
                  // Curstomtopappar(
                  //   title: "My Cart",
                  // ),
                  SizedBox(
                    height: 5,
                  ),
                  Topcardcart(
                      title:
                          "You have ${controller.nbreoccurenceorder} items in Your List "),
                  ...List.generate(controller.data.length, (index) {
                    return Customorder(
                      onAdd: () async {
                        await controller
                            .addCart("${controller.data[index].itemsId}");
                        controller.refreshPage();
                      },
                      onRemove: () async {
                        await controller
                            .removeCart("${controller.data[index].itemsId}");
                        controller.refreshPage();
                      },
                      count: "${controller.data[index].nbreoccurence}",
                      price: "${ controller.data[index].price}",
                      title: "${controller.data[index].itemsName}",
                      imagename: "${controller.data[index].itemsImage}",
                    );
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
