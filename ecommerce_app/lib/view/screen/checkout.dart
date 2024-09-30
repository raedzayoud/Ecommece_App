import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
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
                onPressed: () {
                  controller.checkout();
                },
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
      body: GetBuilder<CheckoutController>( // Use GetBuilder here
        builder: (controller) {
          return Container(
            color: AppColor.white,
            child: ListView(
              children: [
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    "Choose Payment Method",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    controller.ChoosePaymentMethod("0");
                  },
                  child: Cardpaymentmethod(
                    isActive: controller.paymentMethod == "0",
                    title: "Cash on Delivery",
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.ChoosePaymentMethod("1");
                  },
                  child: Cardpaymentmethod(
                    isActive: controller.paymentMethod == "1",
                    title: "Payment Cards",
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    "Choose Delivery Type",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      InkWell(
                        onTap: () {
                          controller.ChooseDelivery("0");
                        },
                        child: Carddeliverytype(
                          isAcive: controller.delevriyType == "0",
                          name: AppImageassets.delevriy,
                          title: "Delivery",
                        ),
                      ),
                      SizedBox(width: 30),
                      InkWell(
                        onTap: () {
                          controller.ChooseDelivery("1");
                        },
                        child: Carddeliverytype(
                          isAcive: controller.delevriyType == "1",
                          name: AppImageassets.delevriyclient,
                          title: "Give it To Client",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                controller.delevriyType == "0"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(controller.data.isNotEmpty)
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              "Shipping Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          SizedBox(height: 10),
                          // Handle address data and "no data" case
                          controller.statusRequest == StatusRequest.loading
                              ? Center(child: CircularProgressIndicator())
                              : controller.data.isEmpty
                                  ? Center(child: Container(
                                  margin: EdgeInsets.only(top: 40),
                                  child: Text("No address available.Please go to your \n profile and add an address.Thank you !",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: AppColor.primaycolor,),)))
                                  : Column(
                                      children: List.generate(
                                        controller.data.length,
                                        (index) => InkWell(
                                          onTap: () {
                                            controller.ChooseShipping(
                                              controller.data[index].addressId
                                                  .toString(),
                                            );
                                          },
                                          child: Cardshipping(
                                            title:
                                                "${controller.data[index].addressName}",
                                            subtitle:
                                                "${controller.data[index].addressCity} ${controller.data[index].addressStreet}",
                                            isAcive: controller
                                                    .data[index].addressId
                                                    .toString() ==
                                                controller.adressid,
                                          ),
                                        ),
                                      ),
                                    ),
                        ],
                      )
                    : SizedBox.shrink(), // Hide when not "Delivery"
              ],
            ),
          );
        },
      ),
    );
  }
}
