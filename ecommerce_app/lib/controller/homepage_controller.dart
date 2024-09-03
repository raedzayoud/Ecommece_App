import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController{}

class HomepageControllerImp extends HomepageController{
  MyServices myServices=Get.find();
  String ?username;
  initialData(){
    username=myServices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}