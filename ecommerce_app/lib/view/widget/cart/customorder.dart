import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

class Customorder extends StatelessWidget {
  final String title;
  final String price;
  final String count;
  const Customorder({super.key, required this.title, required this.price, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        color: AppColor.white,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5),
              height: 107,
              child: Expanded(
                  flex: 2, child: Image.asset(AppImageassets.logoauth)),
            ),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(title),
                  subtitle: Text(
                    "$price \$",
                    style: TextStyle(color: AppColor.primaycolor),
                  ),
                )),
            Expanded(
                child: Column(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                Text(count),
                IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
