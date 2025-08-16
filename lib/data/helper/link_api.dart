class ApiLink{
static const String server="https://store-project.shop/api/v1";

//========================Home===============
static const String home="$server/home/get-home";

  static const String  searchCategory="$server/categories/search-category";


//===========================Auth=======================
static const String register="$server/users/register";
  static const String verifyCode="$server/users/verify-code";
  static const String login="$server/users/login";
  static const String updateProfile="$server/users/update-profile";


  //===========================forgetPassword=======================
  static const String forgetPassword="$server/users/forget-password";
  static const String checkResetCode="$server/users/check-reset-code";
  static const String resetPassword="$server/users/reset";
  //===========================product=======================

  static const String product="$server/products/get-product";

  static const String  searchProduct="$server/products/search-product";
  static const String  addProduct="$server/products/add-product";


  static const String  updateProduct="$server/products/update-product";

  static const String  deleteProduct="$server/products/delete-product";


  //===========================favorites=======================

  static const String favorite="$server/favorites/favarite";

  static const String myFavorite="$server/favorites/get-favarites";


//========================================cart====================

  static const String addAndRemoveCart="$server/carts/cart";

  static const String getCart="$server/carts/get-cart";

//========================================Address====================

  static const String addAddress="$server/address/add-address";
  static const String updateAddress="$server/address/update-address";
  static const String deleteAddress="$server/address/delete-address";
  static const String getAddress="$server/address/get-address";


//========================================Order====================

  static const String addOrder="$server/orders/add-order";

  static const String getOrder="$server/orders/get-orders";


//========================================Categories====================
  static const String category="$server/categories/get-category";

  static const String  addCategory="$server/categories/add-category";

  static const String  updateCategory="$server/categories/update-category";




}