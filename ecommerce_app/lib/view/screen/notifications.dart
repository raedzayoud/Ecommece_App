import 'package:ecommerce_app/controller/notifications_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: GetBuilder<NotificationsController>(
        builder: (controller) => Container(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              ...List.generate(controller.data.length, (index) {
                return Container(
                  child: Stack(
                    children: [
                      Center(
                        child: Card(
                          color: AppColor.white,
                          child: ListTile(
                            title: Text(
                              controller.data[index]['notifications_title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                controller.data[index]['notifications_body']),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 13,
                        top: 15,
                        child: Text(
                            "${Jiffy.parse(controller.data[index]['notifications_datatime']).fromNow()}",style: TextStyle(
                              color: AppColor.primaycolor,fontWeight: FontWeight.w700
                            ),),
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
