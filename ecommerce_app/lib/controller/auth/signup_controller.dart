import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/sigup_data.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  Signup();
  goToLogin();
}

class SignupControllerImp extends SignupController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController age;
  late TextEditingController phone;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    age = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }

  SigupData signupdata = SigupData(Get.find());

  List data = [];

  StatusRequest ? statusRequest;

  @override
  Signup() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupdata.postData(username.text,password.text,age.text,phone.text,email.text);
      if (response == null) {
        statusRequest = StatusRequest.failed;
      }
      statusRequest = HandleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
         // data.addAll(response['data']);
          Get.offNamed(AppRoutes.verifycodesignup,arguments: {
            "email":email.text
          });
        } else {
          Get.defaultDialog(title: "Warning",middleText: "Email or Phone aleardy exists");
          statusRequest = StatusRequest.failed;
        }
      }
      update();
      
    } else {}
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
