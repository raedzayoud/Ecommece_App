import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class SigupData {
  Crud crud;

  SigupData(this.crud);

  postData(String username,String password,String age,String phone,String email ) async {
    var response = await crud.postData(AppLinkApi.signup, {
      "username":username,
      "password":password,
      "age":age,
      "phone":phone,
      "email":email
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
