import 'package:ecommerce_app/controller/orderdetails_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orderdetails extends StatelessWidget {
  const Orderdetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderdetailsController controller = Get.put(OrderdetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("OrderDetails"),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 150,
              child: Card(
                color: AppColor.white,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Table(
                      children: [
                        TableRow(children: [
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                        ]),
                        TableRow(children: [
                          Text(
                            "Item",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.secondcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Text(
                            "Quantity",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.secondcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Text(
                            "Price",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.secondcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ]),
                        TableRow(children: [
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                        ]),
                        TableRow(children: [
                          Text(
                            "Item",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Quantity",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Price",
                            textAlign: TextAlign.center,
                          ),
                        ]),
                        TableRow(children: [
                          SizedBox(height: 5),
                          SizedBox(height: 5),
                          SizedBox(height: 5),
                        ]),
                        TableRow(children: [
                          Text(
                            "Item",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Quantity",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Price",
                            textAlign: TextAlign.center,
                          ),
                        ])
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Price : 2400 \$",
                        style: TextStyle(
                            color: AppColor.secondcolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Card(
                color: AppColor.white,
                child: ListTile(
                  title: Text(
                    "Shipping Address",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.secondcolor),
                  ),
                  subtitle: Text("Mellitta Houmt Souk  Djerba "),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
