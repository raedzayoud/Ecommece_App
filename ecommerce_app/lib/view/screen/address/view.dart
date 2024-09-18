import 'package:ecommerce_app/controller/address/addressview_controller.dart';
import 'package:ecommerce_app/controller/settings_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Adressview extends StatelessWidget {
  const Adressview({super.key});

  @override
  Widget build(BuildContext context) {
    AddressviewControllerImp controllerImp =
        Get.put(AddressviewControllerImp());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoutes.addaddress);
            },
            child: Icon(
              Icons.add,
              color: AppColor.white,
            ),
            backgroundColor: AppColor.primaycolor),
        appBar: AppBar(
          backgroundColor: AppColor.primaycolor,
          title: Text(
            "Address",
            style: TextStyle(color: AppColor.white),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.white),
            onPressed: () {
              Get.toNamed(AppRoutes.settings);
            },
          ),
        ),
        body: GetBuilder<AddressviewControllerImp>(
          builder: (controllerImp) => Handlingdataview(
            statusRequest: controllerImp.statusRequest,
            widget: Container(
              child: ListView.builder(
                  itemCount: controllerImp.data.length,
                  itemBuilder: (context, index) {
                    return CartAddress(
                      addressmodel: controllerImp.data[index],
                    );
                  }),
            ),
          ),
        ));
  }
}

class CartAddress extends StatelessWidget {
  final addressModel addressmodel;
  const CartAddress({super.key, required this.addressmodel});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColor.white,
        child: Container(
          child: ListTile(
            title: Text("${addressmodel.addressName}"),
            subtitle: Text(
                "${addressmodel.addressCity}  ${addressmodel.addressCity}"),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ),
        ));
  }
}
