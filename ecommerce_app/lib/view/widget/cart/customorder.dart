import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class Customorder extends StatelessWidget {
  final String title;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const Customorder(
      {super.key,
      required this.title,
      required this.price,
      required this.count,
      required this.imagename,
      required this.onAdd,
      required this.onRemove});

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
                  flex: 2,
                  child: HashCachedImage(
                      imageUrl: "${AppLinkApi.imagesItems}/${imagename}")),
            ),
            Expanded(
                flex: 5,
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
                IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                Text(count),
                IconButton(onPressed: onRemove, icon: Icon(Icons.remove)),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
