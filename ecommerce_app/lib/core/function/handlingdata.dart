import 'package:ecommerce_app/core/class/statusrequest.dart';

HandleData(respone){

  if(respone is StatusRequest){
    return respone;
  }

  else{
    return StatusRequest.success;
  }

}