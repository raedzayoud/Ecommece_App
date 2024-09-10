import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class MyfavouriteData {
  Crud crud;

  MyfavouriteData(this.crud);

  getMyFavourite(String userid) async {
    var response = await crud.postData(AppLinkApi.myfavourite, {
      "userid":userid,
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
