import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  Logout();
  isActivenotification(bool isActive);
  goToAddress();
}

class SettingsControllerImp extends SettingsController {
  bool isActive1=false;
  MyServices myServices = Get.find();
  @override
  Logout() {
    myServices.sharedPreferences.clear();
    Get.offNamed(AppRoutes.login);
  }

  @override
   isActivenotification(bool isActive) {
    isActive1=isActive;
     update();
  }
  
  @override
  goToAddress() {
    Get.toNamed(AppRoutes.adressview);
  }
  goToSettings() {
    Get.back();
  }
}
