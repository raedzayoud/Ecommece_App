import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/login_data.dart';
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
  StatusRequest  statusRequest=StatusRequest.none;
    LoginData loginData=LoginData(Get.find());
  showpassword(){
    isshowpassword=isshowpassword==true?false:true;
    update();
  }
  @override
  Login()async {
    if(formstate.currentState!.validate()){
        statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(password.text, email.text);
      if (response == null) {
        statusRequest = StatusRequest.failed;
      }
      statusRequest = HandleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.home);
        } else {
          Get.defaultDialog(title: "Warning",middleText: "Email or Password is not correct ! ");
          statusRequest = StatusRequest.failed;
        }
      }
      update();

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
