import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/login_data.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginControlller extends GetxController {
  Login();
  goToSignup();
  goToForgetPassword();
}

class LoginControlllerImp extends LoginControlller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices services=Get.find();
  LoginData loginData = LoginData(Get.find());
  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  Login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(password.text, email.text);
      if (response == null) {
        statusRequest = StatusRequest.failed;
      }
      statusRequest = HandleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          services.sharedPreferences.setString("id", response['data']['user_id'].toString());
          services.sharedPreferences.setString("username", response['data']['user_name']);
          services.sharedPreferences.setString("email", response['data']['user_email']);
          services.sharedPreferences.setString("phone", response['data']['user_phone'].toString());
          services.sharedPreferences.setString("age", response['data']['user_age'].toString());
          services.sharedPreferences.setString("step","2");
          Get.offNamed(AppRoutes.home);
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Email or Password is not correct ! ");
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignup() {
    Get.offAllNamed(AppRoutes.singup);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("-----------------------------------------------------------");
      print(value);
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  goToForgetPassword() {
    Get.offAllNamed(AppRoutes.forgetpassword);
  }
}
