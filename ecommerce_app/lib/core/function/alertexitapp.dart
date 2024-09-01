import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<bool> alertExitApp()  {
    Get.defaultDialog(
    title: "Warning",
    middleText: "Do you want to exit the application?",
    actions: [
      ElevatedButton(
        onPressed: () {
          Get.back(result: false); // Don't exit the app
        },
        child: Text("Cancel"),
      ),
      ElevatedButton(
        onPressed: () {
          exit(0); // Exit the app
        },
        child: Text("Confirm"),
      ),
    ],
    
  );
  return Future.value(true);
}