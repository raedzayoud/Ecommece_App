import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Text(
              "Cart ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Card(
              child: Row(
                children: [
                  Expanded(
                  flex: 2,
                  child: Image.asset(AppImageassets.logoauth)),
                  Expanded(
                  flex: 3,  
                  child:ListTile(title:  Text("MacBook M2"),subtitle: Text("300.000 \$",style: TextStyle(color: AppColor.primaycolor),),)),
                  Expanded(
                      child: Column(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                     Text("20"),
                      IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                    ],
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
