import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductdetailsController extends GetxController {}

class ProductdetailsControllerImp extends ProductdetailsController {
  late ItemsModel itemsModel;

  List Produits = [
    {
      "id":"1",
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

  initialData() {
    itemsModel = Get.arguments['itemsModel'];
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
