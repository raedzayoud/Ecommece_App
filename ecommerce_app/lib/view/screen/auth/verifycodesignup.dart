import 'package:ecommerce_app/controller/auth/forgetpassword_controller.dart';
import 'package:ecommerce_app/controller/auth/login_controlller.dart';
import 'package:ecommerce_app/controller/auth/verifycode_controller.dart';
import 'package:ecommerce_app/controller/auth/verifycodesignup_controller.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/view/widget/auth/curstomtextformauth.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextsignup.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitleauth.dart';
import 'package:ecommerce_app/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Verifycodesignup extends StatelessWidget {
  const Verifycodesignup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifycodesignupControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.white,
          elevation: 0.0,
          title: Text(
            "Verify Code",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<VerifycodesignupControllerImp>(
          builder: (controlllerImp) =>
              controlllerImp.statusRequest == StatusRequest.loading
                  ? Center(
                      child: Lottie.asset(AppImageassets.loading,
                          width: 250, height: 250))
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      color: Colors.white,
                      padding: EdgeInsets.all(20),
                      child: ListView(
                        children: [
                          Customtexttitleauth(
                            title: "Check Code",
                          ),
                          Customtextbodyauth(
                            body:
                                "Please Enter the Digit Code Sent To ${controlllerImp.email}",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          OtpTextField(
                            numberOfFields: 5,
                            fieldWidth: 50,
                            borderRadius: BorderRadius.circular(30),
                            borderColor: Color(0xFF512DA8),
                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              controlllerImp.goToSuccessSigun(verificationCode);
                            }, // end onSubmit
                          ),
                        ],
                      )),
        ));
  }
}
