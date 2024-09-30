import 'package:ecommerce_app/controller/settings_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controllerImp = Get.put(SettingsControllerImp());
    return Scaffold(
        body: GetBuilder<SettingsControllerImp>(
      builder: (controllerImp) => Container(
        color: AppColor.white,
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  color: AppColor.primaycolor,
                  height: Get.width / 2.5,
                ),
                Positioned(
                    top: Get.width / 4.0,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(70)),
                      child: CircleAvatar(
                        backgroundColor: AppColor.white,
                        radius: 40,
                        backgroundImage: AssetImage(AppImageassets.man),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Card(
                color: AppColor.white,
                child: Column(
                  children: [
                    // ListTile(
                    //   onTap: () {},
                    //   title: Text("Disable Notifications "),
                    //   trailing: Switch(
                    //     onChanged: (val) {
                    //       controllerImp.isActivenotification(val);
                    //     },
                    //     value: controllerImp.isActive1,
                    //   ),
                    // ),
                  //  Divider(),
                    ListTile(
                      onTap: () {
                        // controllerImp.goToAddress();
                        Get.toNamed(AppRoutes.orders);
                      },
                      title: Text("Orders"),
                      trailing: Icon(Icons.card_travel_outlined),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        controllerImp.goToArchives();
                      },
                      title: Text("Archives"),
                      trailing: Icon(Icons.archive_outlined),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        controllerImp.goToAddress();
                      },
                      title: Text("Address"),
                      trailing: Icon(Icons.location_on_outlined),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {},
                      title: Text("About us "),
                      trailing: Icon(Icons.help_outline),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        launchUrl(Uri.parse("tel:+216 27740388"));
                      },
                      title: Text("Contact us"),
                      trailing: Icon(Icons.phone_callback_outlined),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Logout "),
                      onTap: () {
                        controllerImp.Logout();
                      },
                      trailing: Icon(Icons.logout),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
