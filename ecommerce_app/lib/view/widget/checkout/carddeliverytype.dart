import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Carddeliverytype extends StatelessWidget {
  final String title;
  final String name;
  final bool isAcive;
  const Carddeliverytype(
      {super.key,
      required this.title,
      required this.name,
      required this.isAcive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 120,
      decoration: BoxDecoration(
         color:isAcive==true? AppColor.primaycolor:null,
        border: Border.all(color: AppColor.primaycolor),
      ),
      child: Column(
        children: [
          Lottie.asset(name, width: 100, height: 100),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: isAcive==true?AppColor.white:AppColor.black
            ),
          )
        ],
      ),
    );
  }
}
