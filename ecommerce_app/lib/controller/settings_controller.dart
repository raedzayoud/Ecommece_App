import 'package:ecommerce_app/controller/address/addressview_controller.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

/*

You Must used solution more better 

*/

abstract class SettingsController extends GetxController {
  Logout();
  isActivenotification(bool isActive);
  goToAddress();
}

class SettingsControllerImp extends SettingsController {
  bool isActive1 = false;
  MyServices myServices = Get.find();
  AddressviewControllerImp  addressviewControllerImp=Get.put(AddressviewControllerImp());
  @override
  Logout() {
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${myServices.sharedPreferences.getString("id")}");
    myServices.sharedPreferences.clear();
    Get.offNamed(AppRoutes.login);
  }

  @override
  isActivenotification(bool isActive) {
    isActive1 = isActive;
    update();
  }

  @override
  goToAddress() {
   addressviewControllerImp.refreshpage();
    Get.toNamed(AppRoutes.adressview);
    
  }

  goToSettings() {
    Get.back();
  }
}
