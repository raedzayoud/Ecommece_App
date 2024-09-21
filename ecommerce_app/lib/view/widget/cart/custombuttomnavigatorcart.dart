import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/widget/cart/custombuttomcart.dart';
import 'package:ecommerce_app/view/widget/cart/custompriceshipping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custombuttomnavigatorcart extends StatelessWidget {
  const Custombuttomnavigatorcart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
        builder: (controller) => Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  controller.couponname==null?Container(
                    margin: EdgeInsets.only(bottom: 20, left: 10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: TextFormField(
                              style: TextStyle(color: AppColor.black),
                              controller: controller.couponcontroller,
                              decoration: InputDecoration(
                                  hintText: " Coupon Code",
                                  hintStyle: TextStyle(),
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                                  border: OutlineInputBorder()),
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 10 ),
                              child: MaterialButton(
                                color: AppColor.primaycolor,
                                onPressed: () {
                                  controller.checkcoupon();
                                },
                                child: Text(
                                  "apply",
                                  style: TextStyle(
                                      color: AppColor.white, fontSize: 17),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ):Container(child: Text("")),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColor.primaycolor, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Custompriceshipping(
                          price: "${controller.totalprice}\$",
                          title: "Price",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Custompriceshipping(
                          price: "${controller.discountcoupon}%",
                          title: "Discount",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Custompriceshipping(
                          price: "10%",
                          title: "Shipping",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider()),
                        Custompriceshipping(
                          price: "${controller.getTotalPrice()}\$",
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
                    content: "Orders ",
                    onPressed: () {
                      Get.toNamed(AppRoutes.checkout);
                    },
                  ),
                ],
              ),
            ));
  }
}
