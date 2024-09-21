import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class Cardshipping extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isAcive;
  const Cardshipping(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isAcive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color:isAcive==true? AppColor.primaycolor:AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text("${title}",style: TextStyle(
            color: isAcive==true?AppColor.white:AppColor.black
          ),),
          subtitle: Text("${subtitle}",style: TextStyle(
            color: isAcive==true?AppColor.white:AppColor.black)),
        ),
      ),
    );
  }
}
