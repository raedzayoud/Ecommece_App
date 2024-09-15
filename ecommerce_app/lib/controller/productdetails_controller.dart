import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductdetailsController extends GetxController {}

class ProductdetailsControllerImp extends ProductdetailsController {
  late ItemsModel itemsModel;
  CartControllerImp cartControllerImp = Get.put(CartControllerImp());
  StatusRequest statusRequest = StatusRequest.none;
  int count = 0;
  List Produits = [
    {
      "id": "1",
      "name": "red",
      "active": "1",
    },
    {
      "id": "2",
      "name": "black",
      "active": "0",
    },
    {
      "id": "3",
      "name": "blue",
      "active": "0",
    }
  ];

  GoTocart() {
    Get.toNamed(AppRoutes.cart);
  }

  initialData() async {
    //statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    count =
        await cartControllerImp.getcountcart(itemsModel.itemsId!.toString());
    // statusRequest = StatusRequest.success;
    update();
  }

  add() {
    cartControllerImp.addCart("${itemsModel.itemsId}");
    count++;
    update();
  }

  remove() {
    if (count > 0) {
      cartControllerImp.removeCart("${itemsModel.itemsId}");
      count--;
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
