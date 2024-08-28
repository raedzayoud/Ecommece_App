import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifycodesignupController extends GetxController {
  goToSuccessSigun();
}

class VerifycodesignupControllerImp extends VerifycodesignupController {
  @override
  goToSuccessSigun() {
    Get.offNamed(AppRoutes.successsignup);
  }
}
