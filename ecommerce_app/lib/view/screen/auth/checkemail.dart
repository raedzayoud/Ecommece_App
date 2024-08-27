import 'package:ecommerce_app/controller/auth/checkemail_controller.dart';
import 'package:ecommerce_app/controller/auth/forgetpassword_controller.dart';
import 'package:ecommerce_app/controller/auth/login_controlller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/curstomtextformauth.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextsignup.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitleauth.dart';
import 'package:ecommerce_app/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkemail extends StatelessWidget {
  const Checkemail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckemailControllerImp controlllerImp=Get.put(CheckemailControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: Text(
        "Check Email",
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
                title: "Sucess sigun up",
              ),
              Customtextbodyauth(
                body:
                    "Create your account to start shopping the latest trends and enjoy exclusive deals",
              ),
              SizedBox(
                height: 10,
              ),
              Curstomtextformauth(
                hintText: "Enter Your Email",
                iconData: Icons.email_outlined,
                label: "Email",
                mycontroller: controlllerImp.email,
              ),
               Custombuttonauth(
                content: "Check",
                onPressed: () {
                  controlllerImp.goToSuccessSigun();
                },
              ),
              
            ],
          )),
    );
  }
}
