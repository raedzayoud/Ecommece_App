import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/view/widget/checkout/carddeliverytype.dart';
import 'package:ecommerce_app/view/widget/checkout/cardpaymentmethod.dart';
import 'package:ecommerce_app/view/widget/checkout/cardshipping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: AppColor.white,
                width: double.infinity,
                height: 40,
                margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  color: AppColor.primaycolor,
                  child: Text(
                    "Checkout",
                    style: TextStyle(color: AppColor.white, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Checkout"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.white),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: GetBuilder<CheckoutController>(
          builder: (controller) => Handlingdataview(
            statusRequest: controller.statusRequest,
            widget: Container(
              color: AppColor.white,
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Choose Payment Method",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Cardpaymentmethod(
                  //   isAcive: true,
                  //   title: "Cash on Delevriy",
                  // ),
                  InkWell(
                      onTap: () {
                        controller.ChoosePaymentMethod("cash");
                      },
                      child: Cardpaymentmethod(
                        isActive:
                            controller.paymentMethod == "cash" ? true : false,
                        title: "Cash on Delevriy",
                      )),
                  SizedBox(
                    height: 10,
                  ),

                  InkWell(
                    onTap: () {
                      controller.ChoosePaymentMethod("card");
                    },
                    child: Cardpaymentmethod(
                      isActive:
                          controller.paymentMethod == "card" ? true : false,
                      title: "Payement Cards",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Choose Delivery Type",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              controller.ChooseDelivery("Delivery");
                            },
                            child: Carddeliverytype(
                              isAcive: controller.delevriyType == "Delivery"
                                  ? true
                                  : false,
                              name: AppImageassets.delevriy,
                              title: "Delivery",
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: () {
                              controller.ChooseDelivery("Client");
                            },
                            child: Carddeliverytype(
                              isAcive: controller.delevriyType == "Client"
                                  ? true
                                  : false,
                              name: AppImageassets.delevriyclient,
                              title: "Give it To Client ",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  controller.delevriyType == "Delivery"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                "Shipping Address",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ...List.generate(
                              controller.data.length,
                              (index) => InkWell(
                                onTap: () {
                                  controller.ChooseShipping(controller
                                      .data[index].addressId
                                      .toString());
                                },
                                child: Cardshipping(
                                  title:
                                      "${controller.data[index].addressName}",
                                  subtitle:
                                      "${controller.data[index].addressCity} ${controller.data[index].addressStreet}",
                                  isAcive: controller.data[index].addressId
                                              .toString() ==
                                          controller.adressid
                                      ? true
                                      : false,
                                ),
                              ),
                            )
                          ],
                        )
                      : Text(""),
                ],
              ),
            ),
          ),
        ));
  }
}
