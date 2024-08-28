import 'package:ecommerce_app/controller/auth/forgetpassword_controller.dart';
import 'package:ecommerce_app/controller/auth/login_controlller.dart';
import 'package:ecommerce_app/controller/auth/resetpassword_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/validinput.dart';
import 'package:ecommerce_app/view/widget/auth/curstomtextformauth.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextsignup.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitleauth.dart';
import 'package:ecommerce_app/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetpasswordControllerImp controlllerImp =
        Get.put(ResetpasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: Text(
          "Reset Password",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Form(
            key: controlllerImp.formState,
            child: ListView(
              children: [
                Customtexttitleauth(
                  title: "New Password",
                ),
                Customtextbodyauth(
                  body: "Please Enter a new Password",
                ),
                SizedBox(
                  height: 10,
                ),
                Curstomtextformauth(
                validator: (val){
                    return validinput(val!, 5 ,100, "password");
                  },
                  hintText: "Enter Your Password",
                  iconData: Icons.lock_outline,
                  label: "Password",
                  mycontroller: controlllerImp.password,
                ),
                Curstomtextformauth(
                  hintText: "Repeat Enter Your Password",
                  iconData: Icons.lock_outline,
                  label: "Password",
                  mycontroller: controlllerImp.repassword,
                  validator: (val){
                    return validinput(val!, 5 ,100, "password");
                  },
                ),
                Custombuttonauth(
                  content: "Save",
                  onPressed: () {
                    controlllerImp.resetPassword();
                  },
                ),
              ],
            ),
          )),
    );
  }
}
