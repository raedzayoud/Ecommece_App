import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class Customcardhome extends StatelessWidget {
  final String title;
  final String  body;
  const Customcardhome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
                child: Stack(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: ListTile(
                      title: Container(
                        margin: EdgeInsets.only(bottom: 10, top: 20),
                        child: Text(
                          title,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      subtitle: Text(
                        body,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    height: 150,
                    decoration: BoxDecoration(
                        color: AppColor.primaycolor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Positioned(
                    top: 15,
                    right: 0,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90),
                              topRight: Radius.circular(10)),
                          color: AppColor.secondcolor),
                    ),
                  )
                ]),
              );
  }
}