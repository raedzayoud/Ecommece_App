import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce_app/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  String? paymentMethod;
  String? delevriyType;
  String? adressid = "0";
  CheckoutData checkData = CheckoutData(Get.find());
  AddressData addressData = AddressData(Get.find());
  List<addressModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  int? couponid;
  int? priceorder;
  String? discountcoupon;

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var response = await addressData
        .getAddress(myServices.sharedPreferences.getString("id")!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => addressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null || delevriyType == null)
      return Get.snackbar(
        "Error", // Title
        "Please fill all the informations ", // Message
        snackPosition: SnackPosition.TOP, // Position of the snackbar
        duration: Duration(seconds: 4), // Display duration
        margin: EdgeInsets.all(10), // Margin around the snackbar
        backgroundColor: Colors.red, // Set the background color to black
        colorText:
            Colors.white, // Optional: Set text color to white for contrast
      );
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    Map<String, String> dataInfo = {
      "orders_userid": myServices.sharedPreferences.getString("id")!,
      "orders_address": adressid.toString(),
      "orders_type": delevriyType!,
      "orders_paymentmethod": paymentMethod!,
      "orders_pricedelivery": "10",
      "orders_price": priceorder.toString(),
      "orders_coupon": couponid.toString(),
      "orders_discount":discountcoupon.toString()
    };

    var response = await checkData.insertData(dataInfo);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);

    Get.offAllNamed(AppRoutes.home);
    Get.snackbar(
      "Success", // Title
      "The order was delivered successfully ", // Message
      snackPosition: SnackPosition.TOP, // Position of the snackbar
      duration: Duration(seconds: 4), // Display duration
      margin: EdgeInsets.all(10), // Margin around the snackbar
      backgroundColor: Colors.black, // Set the background color to black
      colorText: Colors.white, // Optional: Set text color to white for contrast
    );

    update();
  }

  ChoosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  ChooseShipping(String val) {
    adressid = val;
    update();
  }

  ChooseDelivery(String val) {
    delevriyType = val;
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorder = Get.arguments['priceorder'];
    discountcoupon = Get.arguments['discount'].toString();
    getShippingAddress();
    super.onInit();
  }
}
