import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  addAddress(
      String userid, String addressname, String city, String street) async {
    var response = await crud.postData(AppLinkApi.addAddress, {
      "userid": userid,
      "addressname": addressname,
      "city": city,
      "street": street
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

  getAddress(String userid) async {
    var response =
        await crud.postData(AppLinkApi.viewAddress, {"userid": userid});

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

  deleteAddress(String addressId) async {
    var response =
        await crud.postData(AppLinkApi.removeAddress, {"addressid": addressId});
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
