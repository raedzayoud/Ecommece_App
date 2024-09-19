import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/model/catmodel.dart';
import 'package:ecommerce_app/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  view();
}

class CartControllerImp extends CartController {
  TextEditingController? couponcontroller;
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  int count = 0;
  List<Catmodel> data = [];
  int nbreoccurenceorder = 0;
  int totalprice = 0;
  couponModel? couponmodel;

  String? couponname;

  int discountcoupon = 0;

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

  @override
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var response = await cartData
        .getdataCart(myServices.sharedPreferences.getString("id")!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataresponsive = response['data'];
        data.clear();
        data.addAll(dataresponsive.map((e) => Catmodel.fromJson(e)));
        totalprice = response['pricecount']['price'] ?? 0;
        nbreoccurenceorder = int.parse(response['pricecount']['nbreoccurence']);
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkcoupon(couponcontroller!.text);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response['data'] is Map<String, dynamic>) {
          Map<String, dynamic> datacoupon = response['data'];
          couponmodel = couponModel.fromJson(datacoupon);
          discountcoupon = couponmodel!.couponDiscount!;
        } else if (response['data'] is List) {
          // Handle the case where the data is a list, if needed.
          // Example: You could take the first item or show an error.
          List data = response['data'];
          couponmodel = couponModel.fromJson(data);

          discountcoupon = couponmodel!.couponDiscount!;
        } else {
          // Handle unexpected response structure
          statusRequest = StatusRequest.failed;
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    }

    update();
  }

  resetCart() {
    int nbreoccurenceorder = 0;
    int totalprice = 0;
  }

  @override
  void refreshPage() {
    resetCart();
    view();
  }

  @override
  void onInit() {
    couponcontroller = TextEditingController();
    view();
    super.onInit();
  }
}
