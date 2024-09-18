import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/model/addressmodel.dart';
import 'package:get/get.dart';

abstract class AddressviewController extends GetxController {}

class AddressviewControllerImp extends AddressviewController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());
  List<addressModel> data = [];

  @override
  void onInit() {
    viewAddress();
    super.onInit();
  }

  viewAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var response = await addressData
        .getAddress(myServices.sharedPreferences.getString("id")!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => addressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  void refreshData() async {
    await viewAddress();
  }
}
