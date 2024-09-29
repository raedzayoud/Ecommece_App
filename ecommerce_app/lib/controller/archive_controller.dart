import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/archive_data.dart';
import 'package:ecommerce_app/data/datasource/remote/orders_data.dart';
import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:get/get.dart';

class ArchiveController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  ArchiveData ordersData = ArchiveData(Get.find());
  MyServices myServices = Get.find();
  List<orderModel> dataorders = [];

  getordertype(val) {
    if (val == "0") {
      return "Delivery";
    } else if (val == "1") {
      return "Give Directy To Client ";
    }
  }

  getpayementmethod(val) {
    if (val == "0") {
      return "Cash on Delivery";
    } else if (val == "1") {
      return "Payement Card";
    }
  }

  getOrderStatus(val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "The order is being Prepared ";
    } else if (val == "2") {
      return "The order had picked by the delivery man ";
    } else if (val == "3") {
      return "On The Way ";
    } else {
      return "Archive";
    }
  }

  getOrdersArchive() async {
    dataorders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData
        .getDataArchive(myServices.sharedPreferences.getString("id")!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        dataorders.addAll(data.map((e) => orderModel.fromJson(e)));
      } else {
        // Get.defaultDialog(
        //   title: "Warning", middleText: "Email or Phone aleardy exists");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  void refreshOrder() {
    getOrdersArchive();
  }

  sendDataofRating(String orderid,String note, double rating) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData
        .postRating(orderid,note,rating);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // List data = response['data'];
        // dataorders.addAll(data.map((e) => orderModel.fromJson(e)));
          Get.defaultDialog(
           title: "Information", middleText: "Your rating has been submitted successfully! Thank you for your valuable feedback! ");
           refreshOrder();
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
    getOrdersArchive();
    super.onInit();
  }
}
