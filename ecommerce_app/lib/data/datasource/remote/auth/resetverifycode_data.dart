import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class ResetverifycodeData {
  Crud crud;

  ResetverifycodeData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLinkApi.resend, {
      "email": email,
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
