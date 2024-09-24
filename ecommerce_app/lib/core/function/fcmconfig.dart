import 'package:ecommerce_app/controller/orders_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

requestNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

Fcmconfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print("==========================Notification===================");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!,
        snackPosition: SnackPosition.TOP, // Optional: Adjust the position
        backgroundColor:
            Colors.black, // Optional: Customize the background color
        colorText: Colors.white, // Optional: Customize the text color
        duration: Duration(seconds: 4), // Add duration for the Snackbar
        margin: EdgeInsets.all(10));
    refeshOrderData(message.data);
    // icon: Icon(Icons.check_circle, color: Colors.white));
  });
}

void refeshOrderData(data) {
  if (Get.currentRoute == "/orders" && data['pagename'] == "orderrefresh") {
    OrdersController ordersController = Get.find();
    ordersController.refreshOrder();
    print("Order data refreshed");
  } else {
    print("Conditions not met to refresh orders");
  }
}
