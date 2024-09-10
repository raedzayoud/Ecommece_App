import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/favourite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavouriteController extends GetxController {
  setFavoutite(id, val);
}

class FavouriteControllerImp extends FavouriteController {
  Map isfavorite = {};
  StatusRequest statusRequest = StatusRequest.none;
  FavouriteData itemsData = FavouriteData(Get.find());
  MyServices myServices = Get.find();

  @override
  setFavoutite(id, val) {
    isfavorite[id] = val;
    update();
  }

  addFavourite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.addFavourite(
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

  removeFavourite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.removeFavourite(
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
