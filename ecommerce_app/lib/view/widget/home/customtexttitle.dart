import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class Customtexttitle extends StatelessWidget {
  final String title;
  const Customtexttitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20,
              color: AppColor.primaycolor,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
