import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/orders_data.dart';
import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  OrdersData ordersData = OrdersData(Get.find());
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
  
  String getCouponStatus(String val) {
  if (val == "0") {
    return "The total price reflects the original amount without any coupons applied.";
  } else if (val == "1") {
    return "The total price is discounted due to the application of a coupon.";
  } else {
    return "Invalid coupon status.";
  }
}


  getOrderStatus(val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "The order is being Prepared ";
    } else if (val == "2") {
      return "On The Way ";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    dataorders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ordersData.getData(myServices.sharedPreferences.getString("id")!);
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

  deleteOrders(String orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ordersData.deleteOrders(orderid);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
       Get.defaultDialog(
           title: "Informations", middleText: "the order was deleted successfully");
        refreshOrder() ;
      } else {
        // Get.defaultDialog(
        //   title: "Warning", middleText: "Email or Phone aleardy exists");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  void refreshOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
