import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/controller/homescrren_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:ecommerce_app/view/widget/home/customappar.dart';
import 'package:ecommerce_app/view/widget/home/customcardhome.dart';
import 'package:ecommerce_app/view/widget/home/customtexttitle.dart';
import 'package:ecommerce_app/view/widget/home/listcategories.dart';
import 'package:ecommerce_app/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomepageControllerImp());
    return GetBuilder<HomeScrrenControllerImp>(builder: (controller)=>SafeArea(
        child: GetBuilder<HomepageControllerImp>(
      builder: (controllerImp) => Handlingdataview(
        statusRequest: controllerImp.statusRequest,
        widget: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: ListView(
            children: [
              //appar
              Customappar(
                titleappar: "Find Your Product ",
                onPressedIcon: () {},
                onPressedSearch: () {},
              ),
              Customcardhome(
                body: "CashBack 20 %",
                title: "A summer surprise ",
              ),
              Customtexttitle(
                title: "Categories",
              ),
              Listcategories(),
              Customtexttitle(
                title: "Offer For You",
              ),
              Listitemshome(),
              Customtexttitle(
                title: "Product For You",
              ),
              Listitemshome(),
            ],
          ),
        ),
      ),
    )));
  }
}
