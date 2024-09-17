import 'package:ecommerce_app/controller/homepage_controller.dart';
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

abstract class MyfavouriteController extends SearchMixData {
  setFavoutite(id, val);
  getData();
  refreshdata();
}

class MyfavouriteControllerImp extends MyfavouriteController {
  Map isfavorite = {};
  StatusRequest statusRequest = StatusRequest.none;
  MyfavouriteData myfavouriteData = MyfavouriteData(Get.find());
  MyServices myServices = Get.find();
  List<Myfavourite> allData = [];

  @override
  setFavoutite(id, val) {
    searchcontroller=TextEditingController();
    isfavorite[id] = val;
    update();
  }

  @override
  getData() async {
  //  statusRequest = StatusRequest.loading;
    update();
    var response = await myfavouriteData
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

  deletefavourite(String favouriteid) async {
    statusRequest = StatusRequest.loading; // Show loading state
   // update(); // Update UI to show loading

    var response = await myfavouriteData
        .deleteFavourite(favouriteid); // Wait for the delete response

    if (response['status'] == 'success') {
      allData.removeWhere((element) =>
          element.favouriteId == favouriteid); // Remove from list if successful
      //  update(['favouriteList']);
    }

    statusRequest = StatusRequest.success; // Reset status
    // update(); // Refresh UI
    //update();
  }

  @override
  void onInit() {
    searchcontroller=TextEditingController();
    getData();
    super.onInit();
  }

  @override
  refreshdata() {
    allData.clear();
    getData();
  }
}
