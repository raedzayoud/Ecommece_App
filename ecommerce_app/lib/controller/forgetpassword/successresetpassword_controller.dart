import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SuccessresetpasswordController extends GetxController {
  goToLogin();
}

class SuccessresetpasswordControllerImp extends SuccessresetpasswordController {
  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }
  
  
}
