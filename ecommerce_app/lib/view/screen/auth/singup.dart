import 'package:ecommerce_app/controller/auth/signup_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/curstomtextformauth.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextsignup.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitleauth.dart';
import 'package:ecommerce_app/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Singup extends StatelessWidget {
  const Singup({super.key});

  @override
  Widget build(BuildContext context) {
    SignupControllerImp controllerImp = Get.put(SignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: Text(
          "Sign Up ",
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
          child: ListView(
            children: [
              Customtexttitleauth(
                title: "Welcome Back",
              ),
              Customtextbodyauth(
                body:
                    "Create your account to start shopping the latest trends and enjoy exclusive deals!",
              ),
              SizedBox(
                height: 10,
              ),
              Curstomtextformauth(
                hintText: "Enter Your Username",
                iconData: Icons.person_outline,
                label: "Username",
                mycontroller: controllerImp.username,
              ),
              Curstomtextformauth(
                hintText: "Enter Your Email",
                iconData: Icons.email_outlined,
                label: "Email",
                mycontroller: controllerImp.email,
              ),
              Curstomtextformauth(
                hintText: "Enter Your Phone",
                iconData: Icons.phone,
                label: "Phone",
                mycontroller: controllerImp.phone,
              ),
              Curstomtextformauth(
                hintText: "Enter Your Age",
                iconData: Icons.date_range,
                label: "Age",
                mycontroller: controllerImp.age,
              ),
              Curstomtextformauth(
                hintText: "Enter Your Password",
                iconData: Icons.lock_outline,
                label: "Password",
                mycontroller: controllerImp.password,
              ),
              SizedBox(height: 10,),
              Custombuttonauth(
                content: "Sign Up",
                onPressed: () {},
              ),
              SizedBox(
                height: 13,
              ),
             Customtextsignup(
                textone: "Have an account ? ",
                textwo: "Sign In ",
                onTap: (){
                  controllerImp.goToLogin();
                },
              ),
            ],
          )),
    );
  }
}
