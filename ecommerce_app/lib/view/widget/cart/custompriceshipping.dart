import 'package:flutter/material.dart';

class Custompriceshipping extends StatelessWidget {
  final String title;
  final String price;
  final bool isActive;
  const Custompriceshipping(
      {super.key,
      required this.title,
      required this.price,
      this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight:
                      isActive == true ? FontWeight.bold : FontWeight.normal),
            )),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text("$price \$",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: isActive == true
                        ? FontWeight.bold
                        : FontWeight.normal))),
      ],
    );
  }
}
