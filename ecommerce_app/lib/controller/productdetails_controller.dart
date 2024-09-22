import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/model/catmodel.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductdetailsController extends GetxController {}

class ProductdetailsControllerImp extends ProductdetailsController {
  late ItemsModel itemsModel;
  //CartControllerImp cartControllerImp = Get.put(CartControllerImp());
  StatusRequest statusRequest = StatusRequest.none;
  int count = 0;
  List<Catmodel> data = [];
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  List Produits = [
    {
      "id": "1",
      "name": "red",
      "active": "1",
    },
    {
      "id": "2",
      "name": "black",
      "active": "0",
    },
    {
      "id": "3",
      "name": "blue",
      "active": "0",
    }
  ];

  getcountcart(String itemsid) async {
    //statusRequest = StatusRequest.loading;
  //  update();
    var response = await cartData.getcountcart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        count = response['data'];
        print(count);
        return count;
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  GoTocart() {
    // cartControllerImp.refreshPage();
    Get.toNamed(AppRoutes.cart);
  }

  initialData() async {
    //statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    count = await getcountcart(itemsModel.itemsId!.toString());
    // statusRequest = StatusRequest.success;
    update();
  }

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
          duration: Duration(seconds: 1), // Display duration
          margin: EdgeInsets.all(10), // Margin around the snackbar
        );
      } else {
        //   Get.defaultDialog(title: "Warning", middleText: "there is a problem !");
        statusRequest = StatusRequest.failed;
      }
    }

    update();
  }

  @override
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
          duration: Duration(seconds: 1), // Display duration
          margin: EdgeInsets.all(10), // Margin around the snackbar
        );
      } else {
        //   Get.defaultDialog(title: "Warning", middleText: "there is a problem !");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  add() {
    addCart("${itemsModel.itemsId}");
    count++;
    update();
  }

  remove() {
    if (count > 0) {
      removeCart("${itemsModel.itemsId}");
      count--;
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  void refreshData() {
    update();
  }
}
