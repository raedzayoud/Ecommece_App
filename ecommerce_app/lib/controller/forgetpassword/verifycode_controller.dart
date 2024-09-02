import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/checkemail_data.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/verifycode_data.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifycodeController extends GetxController {
  checkCode(String verifycode);
}

class VerifycodeControllerImp extends VerifycodeController {
  String? email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest=StatusRequest.none;
  VerifycodeData verifycodeData = VerifycodeData(Get.find());
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  checkCode(String verifycode) async {
    if (email == null) {
      Get.defaultDialog(title: "Error", middleText: "Email is not provided");
      return;
    }
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodeData.postData(verifycode, email!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.resetpassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "The code is not correct ! ");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }
}
