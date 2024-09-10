import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getData(String idUser,String idcategories) async {
    var response = await crud.postData(AppLinkApi.items, {
      "idUser":idUser,
      "idCategories":idcategories
    });
    
    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }
}
