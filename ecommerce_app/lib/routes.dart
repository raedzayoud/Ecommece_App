import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:ecommerce_app/view/screen/auth/resetpassword.dart';
import 'package:ecommerce_app/view/screen/auth/singup.dart';
import 'package:ecommerce_app/view/screen/auth/verifycode.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes={
  AppRoutes.login:(context)=>Login(),
  AppRoutes.singup:(context)=>Singup(),
  AppRoutes.forgetpassword:(context)=>Forgetpassword(),
  AppRoutes.resetpassword:(context)=>Resetpassword(),
  AppRoutes.verifycode:(context)=>Verifycode(),
};