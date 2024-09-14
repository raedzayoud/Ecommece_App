import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  addCart(String itemsid);
  removeCart(String itemsid);
  
}

class CartControllerImp extends CartController {
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  

  addCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar(
          "Information", // Title
          "The product was added successfully", // Message
          snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
          backgroundColor: AppColor.primaycolor, // Background color
          colorText: Colors.white, // Text color
          icon: Icon(Icons.check_circle, color: Colors.white), // Optional icon
          duration: Duration(seconds: 2), // Display duration
          margin: EdgeInsets.all(10), // Margin around the snackbar
        );
      } else {
        //   Get.defaultDialog(title: "Warning", middleText: "there is a problem !");
        statusRequest = StatusRequest.failed;
      }
    }
  }

  removeCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar(
          "Information", // Title
          "The product was deleted successfully", // Message
          snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
          backgroundColor: AppColor.primaycolor, // Background color
          colorText: Colors.white, // Text color
          icon: Icon(Icons.remove_circle, color: Colors.white), // Optional icon
          duration: Duration(seconds: 2), // Display duration
          margin: EdgeInsets.all(10), // Margin around the snackbar
        );
      } else {
        //   Get.defaultDialog(title: "Warning", middleText: "there is a problem !");
        statusRequest = StatusRequest.failed;
      }
    }
  }
}
