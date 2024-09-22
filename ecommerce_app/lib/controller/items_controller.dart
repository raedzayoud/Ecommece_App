import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/items_data.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchMixData {
  initialData();
  changeitem(int val, int catid);
  getItems(String catid);
  getToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  List data = [];
  int? selectCat;
  int? catid;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices=Get.find();

  @override
  void onInit() {
    initialData();
  }

  initialData() {
    categories = Get.arguments['categories'];
    selectCat = Get.arguments['selectCat'];
    catid = Get.arguments['idcat'];
    getItems(catid.toString());
    searchcontroller=TextEditingController();
  }

  @override
  changeitem(int val, int catid) {
    selectCat = val;
    catid=catid;
    getItems(catid.toString());
    update();
  }

  @override
  getItems(String catid) async {
    if(data.length>0){
      data.clear();
    }
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData(myServices.sharedPreferences.getString("id")!,catid);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        //   Get.defaultDialog(title: "Warning", middleText: "there is a problem !");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  
  
  @override
  getToProductDetails(ItemsModel itemsModel) {
    statusRequest=StatusRequest.success;
    Get.toNamed(AppRoutes.productdetails,arguments: {
      "itemsModel":itemsModel
    });
  }
}
