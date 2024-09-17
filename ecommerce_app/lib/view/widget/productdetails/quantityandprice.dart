import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class Quantityandprice extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String quantity;
  final String price;
  const Quantityandprice(
      {super.key,
      required this.quantity,
      required this.price,
      this.onAdd,
      this.onRemove});

  @override
  Widget build(BuildContext context) {
    print("===========================");
    print(price);
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Quantity :",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaycolor),
            ),
            Row(
              children: [
                IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                Text(
                  "${quantity}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(onPressed: onRemove, icon: Icon(Icons.remove))
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "Price :",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaycolor),
            ),
            SizedBox(
              width: 47,
            ),
            Text(
              "${price}\$",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
