import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class Bodytext extends StatelessWidget {
  final String body;
  final Color color;
  final double size;
  const Bodytext({super.key, required this.body, required this.color, this.size=18});

  @override
  Widget build(BuildContext context) {
    return Text(
      body,
      style: TextStyle(fontSize: size, fontWeight: FontWeight.bold, color: color),
    );
  }
}
