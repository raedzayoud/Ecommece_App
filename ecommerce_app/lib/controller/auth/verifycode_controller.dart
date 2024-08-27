import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifycodeController extends GetxController {
  checkCode();
  goToRestPassword();
}

class VerifycodeControllerImp extends VerifycodeController {
  late String code;
  @override
  checkCode() {
    // TODO: implement checkCode
    throw UnimplementedError();
  }

  @override
  goToRestPassword() {
    Get.offNamed(AppRoutes.resetpassword);
  }
  

}
