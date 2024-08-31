import 'package:ecommerce_app/controller/test_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        centerTitle: true,
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          return Handlingdataview(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text("$index"),
                      Text("${controller.data}"),
                    ],
                  );
                }),
          );
        },
      ),
    );
  }
}
