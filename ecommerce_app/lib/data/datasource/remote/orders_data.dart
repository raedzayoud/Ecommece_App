import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class OrdersData {
  Crud crud;

  OrdersData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLinkApi.orders, {
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
  
  getDataDetails(String orderid) async {
    var response = await crud.postData(AppLinkApi.ordersdetails, {
      "orderid":orderid
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

  deleteOrders(String orderid) async {
    var response = await crud.postData(AppLinkApi.ordersdelete, {
      "orderid":orderid
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
