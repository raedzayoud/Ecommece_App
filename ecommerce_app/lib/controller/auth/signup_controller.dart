import 'package:ecommerce_app/core/constant/routes.dart';
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

  @override
  Signup() {
    if (formstate.currentState!.validate()) {
      Get.offNamed(AppRoutes.verifycodesignup);
    }
    else{
      
    }
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
