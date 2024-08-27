import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckemailController extends GetxController {
  Checkemail();
  goToSuccessSigun();
}

class CheckemailControllerImp extends CheckemailController {
  late TextEditingController email;
  

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  
  @override
  Checkemail() {
 
  }
  
  @override
  goToSuccessSigun() {
    Get.offAllNamed(AppRoutes.successsignup);
  }

}
