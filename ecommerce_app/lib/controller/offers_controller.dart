import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/archive_data.dart';
import 'package:ecommerce_app/data/datasource/remote/offers_data.dart';
import 'package:ecommerce_app/data/datasource/remote/orders_data.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  OffersData ordersData = OffersData(Get.find());
  MyServices myServices = Get.find();
  List<ItemsModel> dataItems = [];

  getData() async {
    dataItems.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getData();
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        dataItems.addAll(data.map((e) => ItemsModel.fromJson(e)));
      } else {
        // Get.defaultDialog(
        //   title: "Warning", middleText: "Email or Phone aleardy exists");
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
