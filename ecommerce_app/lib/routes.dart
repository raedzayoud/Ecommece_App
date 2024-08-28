import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:ecommerce_app/view/screen/auth/singup.dart';
import 'package:ecommerce_app/view/screen/auth/success_signup.dart';
import 'package:ecommerce_app/view/screen/auth/verifycodesignup.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes={
  AppRoutes.login:(context)=>Login(),
  AppRoutes.singup:(context)=>Singup(),
  AppRoutes.forgetpassword:(context)=>Forgetpassword(),
  AppRoutes.resetpassword:(context)=>Resetpassword(),
  AppRoutes.verifycode:(context)=>Verifycode(),
  AppRoutes.successresetpassword:(context)=>SuccessResetpassword(),
  AppRoutes.successsignup:(context)=>SuccessSignup(),
  AppRoutes.verifycodesignup:(context)=>Verifycodesignup(),
};