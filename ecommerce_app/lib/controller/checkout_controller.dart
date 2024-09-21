import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handlingdata.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  String? paymentMethod;
  String? delevriyType;
  String? adressid;
  AddressData addressData = AddressData(Get.find());
  List<addressModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();


  getShippingAddress() async {
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

  ChoosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  ChooseShipping(String val) {
    adressid = val;
    update();
  }

  ChooseDelivery(String val) {
    delevriyType = val;
    update();
  }

  @override
  void onInit() {
    getShippingAddress();
    super.onInit();
  }
}
