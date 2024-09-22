class AppLinkApi {
  static String linkServeurName = "http://192.168.10.173/ecommerce";
  //

  //===================================Image===================================//

  static String imagesCategories = "$linkServeurName/upload/categories";

  static String imagesItems = "$linkServeurName/upload/items";
  //===================================Test===================================//
  static String test = "$linkServeurName/test.php";
  //===================================auth===================================//

  static String signup = "$linkServeurName/auth/signup.php";
  static String login = "$linkServeurName/auth/login.php";
  static String verifycodesignup = "$linkServeurName/auth/verifycode.php";
  static String resend = "$linkServeurName/auth/resetverifycode.php";

  //===================================Forgetpassword===================================//

  static String checkemail = "$linkServeurName/forgetpassword/checkemail.php";
  static String resetpassword =
      "$linkServeurName/forgetpassword/resetpassword.php";
  static String verifycode = "$linkServeurName/forgetpassword/verifycode.php";

  //===================================Home===================================//

  static String homepage = "$linkServeurName/home.php";

  //===================================DataItems===================================//

  static String items = "$linkServeurName/items/view.php";
  static String search = "$linkServeurName/items/search.php";

  //===================================Favourite===================================//

  static String addFavourite = "$linkServeurName/favourite/add.php";
  static String removeFavourite = "$linkServeurName/favourite/remove.php";
  static String myfavourite = "$linkServeurName/favourite/view.php";
  static String deletefavourite =
      "$linkServeurName/favourite/deletefavourite.php";

  //===================================Cart===================================//
  static String addCart = "$linkServeurName/Cart/add.php";
  static String removeCart = "$linkServeurName/Cart/delete.php";
  static String viewCart = "$linkServeurName/Cart/view.php";
  static String getcountcart = "$linkServeurName/Cart/getcount.php";

  // address
  static String addAddress = "$linkServeurName/address/add.php";
  static String removeAddress = "$linkServeurName/address/delete.php";
  static String viewAddress = "$linkServeurName/address/view.php";
  
  //coupons
  static String checkcoupon = "$linkServeurName/coupon/checkcoupon.php";

  //orders
  static String checkout = "$linkServeurName/order/checkout.php";




}
