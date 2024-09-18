import 'package:ecommerce_app/controller/address/addaddress_controller.dart';
import 'package:ecommerce_app/controller/address/addressview_controller.dart';
import 'package:ecommerce_app/controller/settings_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/widget/auth/curstomtextformauth.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Adressadd extends StatelessWidget {
  const Adressadd({super.key});

  @override
  Widget build(BuildContext context) {
    AddaddressControllerImp controllerImp = Get.put(AddaddressControllerImp());
   
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaycolor,
          title: Text(
            "Add Address",
            style: TextStyle(color: AppColor.white),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.white),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: GetBuilder<AddaddressControllerImp>(
          builder: (controllerImp) => Handlingdataview(
            statusRequest: controllerImp.statusRequest,
            widget: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Curstomtextformauth(
                      hintText: "Name",
                      label: "Name",
                      iconData: Icons.person,
                      mycontroller: controllerImp.name,
                      validator: (val) {}),
                  Curstomtextformauth(
                      hintText: "City",
                      label: "City",
                      iconData: Icons.location_city,
                      mycontroller: controllerImp.city,
                      validator: (val) {}),
                  Curstomtextformauth(
                      hintText: "Street",
                      label: "Street",
                      iconData: Icons.streetview,
                      mycontroller: controllerImp.street,
                      validator: (val) {}),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Custombuttonauth(
                        content: "Add",
                        onPressed: () {
                          controllerImp.addAddress();
                        },
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
