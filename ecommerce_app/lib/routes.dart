import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/middleware/mymiddleware.dart';
import 'package:ecommerce_app/test.dart';
import 'package:ecommerce_app/view/screen/address/add.dart';
import 'package:ecommerce_app/view/screen/address/view.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:ecommerce_app/view/screen/auth/singup.dart';
import 'package:ecommerce_app/view/screen/auth/success_signup.dart';
import 'package:ecommerce_app/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_app/view/screen/cart.dart';
import 'package:ecommerce_app/view/screen/checkout.dart';
import 'package:ecommerce_app/view/screen/homescreen.dart';
import 'package:ecommerce_app/view/screen/itemscategories.dart';
import 'package:ecommerce_app/view/screen/myfavourite.dart';
import 'package:ecommerce_app/view/screen/onborading.dart';
import 'package:ecommerce_app/view/screen/order/archives.dart';
import 'package:ecommerce_app/view/screen/order/orderdetails.dart';
import 'package:ecommerce_app/view/screen/order/orders.dart';
import 'package:ecommerce_app/view/screen/productdetails.dart';
import 'package:ecommerce_app/view/screen/settings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? getPages = [
 GetPage(name: "/", page: () => Onborading(),middlewares: [Mymiddleware()]),
  GetPage(name: AppRoutes.cart, page: () => Cart()),
  GetPage(name: AppRoutes.productdetails, page: () => Productdetails()),
 //  GetPage(name: "/", page: () => Test()),
  GetPage(name: AppRoutes.login, page: () => Login()),
  GetPage(name: AppRoutes.singup, page: () => Singup()),
  GetPage(name: AppRoutes.forgetpassword, page: () => Forgetpassword()),
  GetPage(name: AppRoutes.resetpassword, page: () => Resetpassword()),
  GetPage(
      name: AppRoutes.successresetpassword, page: () => SuccessResetpassword()),
  GetPage(name: AppRoutes.successsignup, page: () => SuccessSignup()),
  GetPage(name: AppRoutes.verifycodesignup, page: () => Verifycodesignup()),
  GetPage(name: AppRoutes.home, page: () => Homescreen()),
  GetPage(name: AppRoutes.verifycode, page: () => Verifycode()),
  GetPage(name: AppRoutes.items, page: () => Itemscategories()),
  GetPage(name: AppRoutes.Myfavourite, page: () => Myfavourite()),
  // address
  GetPage(name: AppRoutes.adressview, page: () => Adressview()),
  GetPage(name: AppRoutes.addaddress, page: () => Adressadd()),
  
  //settings
  GetPage(name: AppRoutes.adressview, page: () => Settings()),
  
  GetPage(name: AppRoutes.checkout, page: () => Checkout()),
  //orders
  GetPage(name: AppRoutes.orders, page: () => Orders()),

  //orderdetails
  GetPage(name: AppRoutes.ordersdetails, page: () => Orderdetails()),
  GetPage(name: AppRoutes.archive, page: () => Archives()),


];
