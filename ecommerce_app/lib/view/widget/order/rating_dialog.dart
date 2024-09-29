import 'package:ecommerce_app/controller/archive_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter/material.dart';

void showDialogWithRating(BuildContext context, orderModel ordermodel) {
  final _dialog = RatingDialog(
    initialRating: 1.0,
    title: Text(
      'Rating Dialog',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    message: Text(
      'Tap a star to set your rating. Add more description here if you want.',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
    ),
    image: Image.asset(
      AppImageassets.logoauth,
      width: 200,
      height: 200,
    ),
    submitButtonText: 'Submit',
    submitButtonTextStyle: TextStyle(
        color: AppColor.primaycolor, fontSize: 20, fontWeight: FontWeight.bold),
    commentHint: 'Set your custom comment hint',
    starSize: 35,
    showCloseButton: true,
    
    onCancelled: () => print('Cancelled'),
    onSubmitted: (response) {
      ArchiveController controller = Get.find();
      controller.sendDataofRating(ordermodel.ordersId.toString(), response.comment, response.rating);
     },
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => _dialog,
  );
}
