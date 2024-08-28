import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SuccesssignupController extends GetxController {
  goToLogin();
}

class SuccesssignupControllerImp extends SuccesssignupController {
  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }
  
  
}
