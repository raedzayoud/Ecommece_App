import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/notifications_data.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  MyServices myServices = Get.find();
  String? username;
  StatusRequest statusRequest = StatusRequest.none;
  NotificationsData homeData = NotificationsData(Get.find());
  List data=[];

  getDataNotifications() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getDataNotifications(myServices.sharedPreferences.getString("id")!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        // Get.defaultDialog(
        //     title: "Warning", middleText: "Email or Phone aleardy exists");
         statusRequest = StatusRequest.failed;
      }
    }
    update();
  }
  
  @override
  void onInit() {
    getDataNotifications();
    super.onInit();
  }


}
