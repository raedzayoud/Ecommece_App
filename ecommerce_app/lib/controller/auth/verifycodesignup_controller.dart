import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifycodesignupController extends GetxController {
  goToSuccessSigun(String verifycode);
  checkCode();
}

class VerifycodesignupControllerImp extends VerifycodesignupController {
//  late String verifycode;
  String? email;
  Verifycodesignup verifycodesignup = Verifycodesignup(Get.find());
  StatusRequest statusRequest=StatusRequest.none;

  @override
  goToSuccessSigun(String verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodesignup.postData(email!, verifycode);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.offNamed(AppRoutes.successsignup);
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "The code is not correct please check your email !");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  checkCode() {}
}
