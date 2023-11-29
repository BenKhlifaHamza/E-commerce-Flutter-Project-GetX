class LinksApi {
  static const String server = "https://ecommerceflutter2023.000webhostapp.com";
  static const String test = "$server/testGetData.php";
  //Images
  static const String linkCategoriesImages = "$server/categories/images";
  static const String linkItemsImages = "$server/items/images";
  //Auth
  static const String signUpLink = "$server/auth/signup.php";
  static const String loginLink = "$server/auth/login.php";
  static const String forgetPasswordLink =
      "$server/auth/forgetpassword/forgetpassword.php";
  static const String verifyCodeForgetPasswordLink =
      "$server/auth/forgetpassword/verifycode.php";
  static const String resetPasswordLink =
      "$server/auth/forgetpassword/resetpassword.php";
  static const String verifyCodeSignUpLink = "$server/auth/verifycode.php";
  static const String resendVerifyCode = "$server/auth/resendverifycode.php";
  //Home
  static const String homePageLink = "$server/homepage.php";
  //Items
  static const String itemsPageLink = "$server/items/viewitems.php";
  static const String addFavorite = "$server/items/addfavorite.php";
  static const String deleteFavorite = "$server/items/deletefavorite.php";
  static const String favoritesView = "$server/items/favoritesview.php";
  static const String removeFavorite = "$server/items/removefavorite.php";
  static const String searchItem = "$server/items/search.php";
  static const String searchItemWithCategorie =
      "$server/items/searchwithcategorie.php";
  //Cart
  static const String cartView = "$server/cart/view.php";
  static const String addCart = "$server/cart/add.php";
  static const String removeCart = "$server/cart/remove.php";
  static const String deleteCart = "$server/cart/deleteall.php";
  //Addresses
  static const String addAddress = "$server/addresses/addaddress.php";
  static const String getAddresses = "$server/addresses/getAddresses.php";
  static const String deleteAddress = "$server/addresses/deleteaddress.php";
  static const String editAddress = "$server/addresses/editaddress.php";
  //Cupon
  static const String getCupon = "$server/cupon/cupon.php";
  //CheckOut
  static const String addOrder = "$server/checkout/addorder.php";
  //Orders
  static const String getOrders = "$server/orders/getorders.php";
  static const String getOrderDetails = "$server/orders/getorderdetails.php";
  static const String deleteOrder = "$server/orders/deleteorder.php";
  static const String ratingOrder = "$server/orders/ratingorder.php";
  //Notifications
  static const String getNotifications =
      "$server/notifications/getnotifications.php";
}
