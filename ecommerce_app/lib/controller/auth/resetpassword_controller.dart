import 'package:ecommerce_app/core/constant/routes.dart';
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
  @override
  resetPassword() {
    // TODO: implement checkCode
    throw UnimplementedError();
  }

  @override
  goToSuccessRestPassword() {
    
  }
  @override
  void onInit() {
    // TODO: implement onInit
    password=TextEditingController();
    repassword=TextEditingController();
    super.onInit();
  }
}
