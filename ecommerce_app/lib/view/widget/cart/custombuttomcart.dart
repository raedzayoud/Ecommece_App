import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custombuttomcart extends StatelessWidget {
  final String content;
  final void Function()? onPressed;
  const Custombuttomcart({super.key, required this.content, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width/1.1,
      margin: EdgeInsets.only(top: 8),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      color: AppColor.primaycolor,
      textColor: AppColor.white,
      child: Text(content,style: TextStyle(fontSize: 18),),
      ),
    );
  }
}