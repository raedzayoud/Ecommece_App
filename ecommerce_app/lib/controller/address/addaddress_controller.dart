import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddaddressController extends GetxController {}

class AddaddressControllerImp extends AddaddressController {
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    super.onInit();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addAddress(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar(
          "Information", // Title
          "The address was added successfully", // Message
          snackPosition: SnackPosition.BOTTOM, // Position of the snackba
          duration: Duration(seconds: 2), // Display duration
          margin: EdgeInsets.all(10), // Margin around the snackbar
        );
        Get.offNamed(AppRoutes.settings);
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }
}
