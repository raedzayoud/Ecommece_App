import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeitem(int val);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectCat;

    @override
  void onInit() {
    initialData();
  }
  

  initialData() {
    categories = Get.arguments['categories'];
    selectCat = Get.arguments['selectCat'];
  }


  @override
  changeitem(int val) {
    selectCat=val;
    update();
  }
}
