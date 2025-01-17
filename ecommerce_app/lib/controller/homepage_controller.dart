import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/function/fcmconfig.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home_data.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomepageController extends SearchMixData {
  initialData();
  getData();
  goToItems(List categories, int selectCat, int categorieid);
}

class HomepageControllerImp extends HomepageController {
  MyServices myServices = Get.find();
  String? username;
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  TextEditingController? searchcontroller;
  List categories = [];
  List items = [];
  List itemstopsellings = [];
  List settings = [];
  bool isSearch = false;
  List<ItemsModel> dataItems = [];
  String title = "";
  String body = "";
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
        itemstopsellings.addAll(response['itemstopsellings']);
        settings.addAll(response['settings']);
        body = settings[0]['settings_body'];
        title = settings[0]['settings_title'];
      } else {
        // Get.defaultDialog(
        //     title: "Warning", middleText: "Email or Phone aleardy exists");
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

  getToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.productdetails,
        arguments: {"itemsModel": itemsModel});
  }
}

class SearchMixData extends GetxController {
  bool isSearch = false;
  StatusRequest statusRequest = StatusRequest.none;
  List<ItemsModel> dataItems = [];
  HomeData homeData = HomeData(Get.find());
  TextEditingController? searchcontroller;

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
      statusRequest = StatusRequest.none;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    SearchData();
    update();
  }

  goToFavourite() {
    Get.toNamed(AppRoutes.Myfavourite);
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
        dataItems.clear();
        dataItems.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }
}
