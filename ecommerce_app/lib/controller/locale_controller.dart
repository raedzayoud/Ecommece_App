import 'package:ecommerce_app/core/function/fcmconfig.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LocaleController extends GetxController {
  @override
  void onInit() {
    requestNotification();
    Fcmconfig();
    super.onInit();
  }
}
