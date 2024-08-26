import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControlller extends GetxController {
  Login();
  goToSignup();
  goToForgetPassword();
}

class LoginControlllerImp extends LoginControlller {
  late TextEditingController email;
  late TextEditingController password;
  @override
  Login() {}

  @override
  goToSignup() {
    Get.offAllNamed(AppRoutes.singup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  
  @override
  goToForgetPassword() {
    Get.offAllNamed(AppRoutes.forgetpassword);
  }
}
