import 'package:ecommerce_app/controller/auth/signup_controller.dart';
import 'package:ecommerce_app/core/class/crud.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
       Get.lazyPut(()=>SignupControllerImp(),fenix: true);
       Get.put(Crud());
       
  }

}