import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/middleware/mymiddleware.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:ecommerce_app/view/screen/auth/singup.dart';
import 'package:ecommerce_app/view/screen/auth/success_signup.dart';
import 'package:ecommerce_app/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_app/view/screen/home.dart';
import 'package:ecommerce_app/view/screen/homescreen.dart';
import 'package:ecommerce_app/view/screen/onborading.dart';
import 'package:ecommerce_app/view/test_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: "/", page: () => Onborading(), middlewares: [Mymiddleware()]),
  // GetPage(name: "/", page: () => TestView()),
  GetPage(name: AppRoutes.login, page: () => Login()),
  GetPage(name: AppRoutes.singup, page: () => Singup()),
  GetPage(name: AppRoutes.forgetpassword, page: () => Forgetpassword()),
  GetPage(name: AppRoutes.resetpassword, page: () => Resetpassword()),
  GetPage(
      name: AppRoutes.successresetpassword, page: () => SuccessResetpassword()),
  GetPage(name: AppRoutes.successsignup, page: () => SuccessSignup()),
  GetPage(name: AppRoutes.verifycodesignup, page: () => Verifycodesignup()),
  GetPage(name: AppRoutes.home, page: () => Homescreen()),
  GetPage(name: AppRoutes.verifycode, page: () => Verifycode()),
];
