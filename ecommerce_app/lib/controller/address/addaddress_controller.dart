import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddaddressController extends GetxController {}

class AddaddressControllerImp extends AddaddressController {
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    super.onInit();
  }
}
