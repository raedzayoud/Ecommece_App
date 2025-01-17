import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class ArchiveData {
  Crud crud;

  ArchiveData(this.crud);

  getDataArchive(String userid) async {
    var response = await crud.postData(AppLinkApi.ordersarchive, {
      "id":userid
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

  
  postRating(String orderid,String note, double rating) async {
    var response = await crud.postData(AppLinkApi.orderrating, {
      "note":note,
      "rating":rating.toString(),
      "id":orderid,
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
