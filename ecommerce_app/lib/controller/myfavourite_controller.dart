import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/favourite_data.dart';
import 'package:ecommerce_app/data/datasource/remote/myfavourite_data.dart';
import 'package:ecommerce_app/data/model/myfavourite.dart';
import 'package:ecommerce_app/view/screen/myfavourite.dart' hide Myfavourite;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MyfavouriteController extends GetxController {
  setFavoutite(id, val);
  getData();
}

class MyfavouriteControllerImp extends MyfavouriteController {
  Map isfavorite = {};
  StatusRequest statusRequest = StatusRequest.none;
  MyfavouriteData itemsData = MyfavouriteData(Get.find());
  MyServices myServices = Get.find();
  List<Myfavourite> allData = [];

  @override
  setFavoutite(id, val) {
    isfavorite[id] = val;
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData
        .getMyFavourite(myServices.sharedPreferences.getString("id")!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        allData.addAll(data.map((e) => Myfavourite.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
