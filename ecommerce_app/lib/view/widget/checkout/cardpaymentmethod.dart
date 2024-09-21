import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class Cardpaymentmethod extends StatelessWidget {
  final String title;
  final bool isActive;
  const Cardpaymentmethod(
      {super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: isActive ? AppColor.primaycolor : AppColor.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? AppColor.white : AppColor.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
