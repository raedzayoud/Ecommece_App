import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/cart/custombuttomcart.dart';
import 'package:ecommerce_app/view/widget/cart/custompriceshipping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custombuttomnavigatorcart extends GetView<CartControllerImp> {
  const Custombuttomnavigatorcart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
        builder: (controller) => Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [

                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaycolor,width: 2),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Custompriceshipping(
                          price: "${controller.totalprice}",
                          title: "Price",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Custompriceshipping(
                          price: "1200",
                          title: "Shipping",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider()),
                        Custompriceshipping(
                          price: "1200",
                          title: "Total Price",
                          isActive: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Custombuttomcart(
                    content: "Place Orders ",
                    onPressed: () {},
                  ),
                ],
              ),
            ));
  }
}
