import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderdetailsController extends GetxController{

  
  orderModel ?ordermodel;

  @override
  void onInit() {
    ordermodel=Get.arguments['orderdetails'];
    super.onInit();
  }



}