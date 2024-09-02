import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/resetpassword_data.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetpasswordController extends GetxController {
  resetPassword();
  goToSuccessRestPassword();
}

class ResetpasswordControllerImp extends ResetpasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest=StatusRequest.none;
  ResetpasswordData resetpasswordData = ResetpasswordData(Get.find());
  @override
  resetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Warning", middleText: "Password is not match  ");
    }
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetpasswordData.postData(password.text, email!);
      if (response == null) {
        statusRequest = StatusRequest.failed;
      }
      statusRequest = HandleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          goToSuccessRestPassword();
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Try Again ! ");
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    } else {}
  }

  @override
  goToSuccessRestPassword() {
    Get.offNamed(AppRoutes.successresetpassword);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }
}
