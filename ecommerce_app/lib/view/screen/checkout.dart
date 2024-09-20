import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Container(
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColor.primaycolor,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "Cash",
                style: TextStyle(
                    color: AppColor.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //isNotActive
            Container(
              height: 40,
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColor.black,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "Payement Cards",
                style: TextStyle(
                    color: AppColor.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Choose Delivery Type",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                    Container(
                      height: 130,
                      width: 120,
                      decoration: BoxDecoration(
                        // color: AppColor.primaycolor,
                        border: Border.all(color: AppColor.primaycolor),
                      ),
                      child: Column(
                        children: [
                          Lottie.asset(AppImageassets.delevriy,
                              width: 100, height: 100),
                          Text(
                            "Delevery",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 130,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primaycolor),
                      ),
                      child: Column(
                        children: [
                          Lottie.asset(AppImageassets.delevriyclient,
                              width: 100, height: 100),
                          Text(
                            "Give it to Client",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Shipping Address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: AppColor.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: Text("Home"),
                  subtitle: Text("Street one Building 23"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: AppColor.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: Text("Company"),
                  subtitle: Text("Street one Building 23"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
