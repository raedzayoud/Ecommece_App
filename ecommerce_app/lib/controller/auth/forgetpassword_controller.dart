import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetpasswordController extends GetxController {
  Checkemail();
  goToCheckCode();
}

class ForgetpasswordControllerImp extends ForgetpasswordController {
  late TextEditingController email;
  

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  
  @override
  Checkemail() {
    // TODO: implement Login
    throw UnimplementedError();
  }
  
  @override
  goToCheckCode() {
    Get.offAllNamed(AppRoutes.verifycode);
  }

}
