import 'package:ecommerce_app/controller/auth/signup_controller.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
       Get.lazyPut(()=>SignupControllerImp(),fenix: true);
  }

}