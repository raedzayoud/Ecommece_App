import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Handlingdataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const Handlingdataview({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest==StatusRequest.loading?Center(
              child: Lottie.asset(AppImageassets.loading,width: 250,height: 250),
            ):statusRequest==StatusRequest.failed?Center(child: Text("No data")):statusRequest==StatusRequest.offlinefailure?Center(
              child: Text("offlinefailure"),
            ):statusRequest==StatusRequest.serverfailure?Center(
              child: Text("serverfailure"),
            ):widget;
    
  }
}