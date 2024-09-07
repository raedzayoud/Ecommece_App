import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductdetailsController extends GetxController{

}

class ProductdetailsControllerImp extends ProductdetailsController{

  late ItemsModel itemsModel;

  initialData(){
    itemsModel=Get.arguments['itemsModel'];
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

}