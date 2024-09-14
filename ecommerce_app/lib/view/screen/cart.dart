import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/cart/curstomtopappar.dart';
import 'package:ecommerce_app/view/widget/cart/custombuttomcart.dart';
import 'package:ecommerce_app/view/widget/cart/custombuttomnavigatorcart.dart';
import 'package:ecommerce_app/view/widget/cart/customorder.dart';
import 'package:ecommerce_app/view/widget/cart/custompriceshipping.dart';
import 'package:ecommerce_app/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Custombuttomnavigatorcart(),
      body: Container(
        color: AppColor.white,
        child: ListView(
          children: [
            Curstomtopappar(
              title: "My Cart",
            ),
            SizedBox(
              height: 5,
            ),
            Topcardcart(title: "You have 2 items in Your List "),
            Customorder(
              count: "2",
              price: "200",
              title: "MackBook 2",
            ),
            Customorder(
              count: "2",
              price: "200",
              title: "MackBook 2",
            ),
          ],
        ),
      ),
    );
  }
}
