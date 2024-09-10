class AppLinkApi {
  static String linkServeurName = "http://192.168.167.48/ecommerce";
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

  //===================================Forgetpassword===================================//

  static String checkemail = "$linkServeurName/forgetpassword/checkemail.php";
  static String resetpassword =
      "$linkServeurName/forgetpassword/resetpassword.php";
  static String verifycode = "$linkServeurName/forgetpassword/verifycode.php";

  //===================================Home===================================//

  static String homepage = "$linkServeurName/home.php";

  //===================================DataItems===================================//

  static String items = "$linkServeurName/items/view.php";

  //===================================Favourite===================================//

  static String addFavourite = "$linkServeurName/favourite/add.php";
  static String removeFavourite = "$linkServeurName/favourite/remove.php";
}
