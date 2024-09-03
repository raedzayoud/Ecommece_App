import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageControllerImp controllerImp = Get.put(HomepageControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Find Product ",
                        hintStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.grey[200]),
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 60,
                    padding: EdgeInsets.symmetric(vertical: 7),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_active_outlined,
                          size: 28,
                          color: Colors.grey[600],
                        )),
                  )
                ],
              ),
            ),
            Container(
              child: Stack(children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: ListTile(
                    title: Container(
                      margin: EdgeInsets.only(bottom: 10, top: 20),
                      child: Text(
                        "A summer surprise ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    subtitle: Text(
                      "Cashback 20% ",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  height: 150,
                  decoration: BoxDecoration(
                      color: AppColor.primaycolor,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Positioned(
                  top: 15,
                  right: 10,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(90)),
                        color: AppColor.secondcolor),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
