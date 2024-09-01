import 'package:ecommerce_app/controller/auth/signup_controller.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/core/function/alertexitapp.dart';
import 'package:ecommerce_app/core/function/validinput.dart';
import 'package:ecommerce_app/view/widget/auth/curstomtextformauth.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextsignup.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Singup extends StatelessWidget {
  const Singup({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: WillPopScope(
        onWillPop: () => alertExitApp(),
        child: GetBuilder<SignupControllerImp>(
          builder: (controllerImp) =>
              controllerImp.statusRequest == StatusRequest.loading
                  ? Center(child: Lottie.asset(AppImageassets.loading,width: 250,height: 250))
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      color: Colors.white,
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: controllerImp.formstate,
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
                              validator: (val) {
                                return validinput(val!, 2, 100, "password");
                              },
                              hintText: "Enter Your Username",
                              iconData: Icons.person_outline,
                              label: "Username",
                              mycontroller: controllerImp.username,
                            ),
                            Curstomtextformauth(
                              validator: (val) {
                                return validinput(val!, 5, 30, "email");
                              },
                              hintText: "Enter Your Email",
                              iconData: Icons.email_outlined,
                              label: "Email",
                              mycontroller: controllerImp.email,
                            ),
                            Curstomtextformauth(
                              validator: (val) {
                                return validinput(val!, 5, 11, "phone");
                              },
                              hintText: "Enter Your Phone",
                              iconData: Icons.phone,
                              label: "Phone",
                              mycontroller: controllerImp.phone,
                              type: TextInputType.number,
                            ),
                            Curstomtextformauth(
                              validator: (val) {
                                return validinput(val!, 2, 100, "age");
                              },
                              hintText: "Enter Your Age",
                              iconData: Icons.date_range,
                              label: "Age",
                              mycontroller: controllerImp.age,
                              type: TextInputType.number,
                            ),
                            Curstomtextformauth(
                              validator: (val) {
                                return validinput(val!, 4, 100, "password");
                              },
                              hintText: "Enter Your Password",
                              iconData: Icons.lock_outline,
                              label: "Password",
                              mycontroller: controllerImp.password,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Custombuttonauth(
                              content: "Sign Up",
                              onPressed: () {
                                controllerImp.Signup();
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Customtextsignup(
                              textone: "Have an account ? ",
                              textwo: "Sign In ",
                              onTap: () {
                                controllerImp.goToLogin();
                              },
                            ),
                          ],
                        ),
                      )),
        ),
      ),
    );
  }
}
