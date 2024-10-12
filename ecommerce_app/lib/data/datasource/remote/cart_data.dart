import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCart(
      String userid, String itemsid, String price, String itemsdiscount) async {
    var response = await crud.postData(AppLinkApi.addCart, {
      "userid": userid,
      "itemsid": itemsid,
      "cartitemsprice": price,
      "itemsdiscount": itemsdiscount
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

  removeCart(String userid, String itemsid) async {
    var response = await crud.postData(
        AppLinkApi.removeCart, {"userid": userid, "itemsid": itemsid});

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

  getcountcart(String userid, String itemsid) async {
    var response = await crud.postData(
        AppLinkApi.getcountcart, {"userid": userid, "itemsid": itemsid});

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

  getdataCart(String userid) async {
    var response = await crud.postData(AppLinkApi.viewCart, {"userid": userid});

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

  checkcoupon(String couponcode) async {
    var response =
        await crud.postData(AppLinkApi.checkcoupon, {"couponcode": couponcode});

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
