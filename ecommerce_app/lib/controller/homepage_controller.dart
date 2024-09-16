import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home_data.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomepageController extends GetxController {
  initialData();
  getData();
  goToItems(List categories, int selectCat, int categorieid);
  goToFavourite();
}

class HomepageControllerImp extends HomepageController {
  MyServices myServices = Get.find();
  String? username;
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  TextEditingController? searchcontroller;
  List categories = [];
  List items = [];
  bool isSearch = false;
  List<ItemsModel> dataItems = [];
  initialData() {
    username = myServices.sharedPreferences.getString("username");

    searchcontroller = TextEditingController();
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData();
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Email or Phone aleardy exists");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  goToItems(List categories, int selectCat, int categorieid) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "selectCat": selectCat,
      "idcat": categorieid
    });
  }

  @override
  goToFavourite() {
    Get.toNamed(AppRoutes.Myfavourite);
  }

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    dataItems.clear();
    isSearch = true;
    SearchData();
    update();
  }

  SearchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.search(searchcontroller!.text);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        dataItems.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }
}
