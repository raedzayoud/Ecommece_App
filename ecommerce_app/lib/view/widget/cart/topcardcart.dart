import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class Topcardcart extends StatelessWidget {
  final String title;
  const Topcardcart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: AppColor.primaycolor, borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        style: TextStyle(color: AppColor.white, fontSize: 15),
      ),
    );
  }
}
