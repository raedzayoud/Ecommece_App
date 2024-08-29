import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginControlller extends GetxController {
  Login();
  goToSignup();
  goToForgetPassword();
}

class LoginControlllerImp extends LoginControlller {
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword=true;
  showpassword(){
    isshowpassword=isshowpassword==true?false:true;
    update();
  }
  @override
  Login() {
    if(formstate.currentState!.validate()){

    }
    else{
      
    }
  }

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
