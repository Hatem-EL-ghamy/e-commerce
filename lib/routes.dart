import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:store_app_advanced/shared/constants/routes.dart';
import 'package:store_app_advanced/shared/middleware/my_middleware.dart';
import 'package:store_app_advanced/view/screen/address/add_address.dart';
import 'package:store_app_advanced/view/screen/address/map.dart';
import 'package:store_app_advanced/view/screen/address/address_view.dart';
import 'package:store_app_advanced/view/screen/address/ubdate_address.dart';
import 'package:store_app_advanced/view/screen/admin/categories/categories_view.dart';
import 'package:store_app_advanced/view/screen/admin/categories/update_categories.dart';
import 'package:store_app_advanced/view/screen/admin/home_admin.dart';
import 'package:store_app_advanced/view/screen/auth/forgetpassword/forget_password_screen.dart';
import 'package:store_app_advanced/view/screen/auth/forgetpassword/reset_password_screen.dart';
import 'package:store_app_advanced/view/screen/auth/forgetpassword/verification_code_screen.dart';
import 'package:store_app_advanced/view/screen/auth/login.dart';
import 'package:store_app_advanced/view/screen/auth/register/register.dart';
import 'package:store_app_advanced/view/screen/auth/register/success_register.dart';
import 'package:store_app_advanced/view/screen/auth/register/verification_code_register_screen.dart';
import 'package:store_app_advanced/view/screen/cart.dart';
import 'package:store_app_advanced/view/screen/category.dart';
import 'package:store_app_advanced/view/screen/orders/cheakout.dart';
import 'package:store_app_advanced/view/screen/favorite.dart';
import 'package:store_app_advanced/view/screen/home.dart';
import 'package:store_app_advanced/view/screen/on_boarding.dart';
import 'package:store_app_advanced/view/screen/orders/order_detalis.dart';
import 'package:store_app_advanced/view/screen/orders/pending.dart';
import 'package:store_app_advanced/view/screen/product/product.dart';
import 'package:store_app_advanced/view/screen/product/product_details.dart';
import 'package:store_app_advanced/view/screen/profile.dart';
import 'package:store_app_advanced/view/screen/settings.dart';
import 'package:store_app_advanced/view/widgets/category/product_category.dart';

import 'layout/layout.dart';
import 'view/screen/admin/categories/add_categories.dart';
import 'view/screen/auth/forgetpassword/success_reset_password.dart';



List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () =>  const OnBoardingScreen() , middlewares: [
    MyMiddleWare()
  ]),


  //==================================Auth============================

  GetPage(name: AppRoute.login, page: () =>  const LoginScreen()),
  GetPage(name: AppRoute.register, page: () =>  const RegisterScreen()),
  GetPage(name: AppRoute.verificationCodeRegister, page: () => const VerificationCodeRegisterScreen()),
  GetPage(name: AppRoute.successRegister, page: () => const SuccessRegisterScreen()),
//===forget=========
  GetPage(name: AppRoute.forgerPassword, page: () => const ForgetPasswordScreen()),
  GetPage(name: AppRoute.verificationCode, page: () => const VerificationCodeScreen()),
  GetPage(name: AppRoute.resetPassword, page: () =>  const ResetPasswordScreen()),
  GetPage(name: AppRoute.successResetPassword, page: () => const SuccessResetPasswordScreen()),


  //===================================HomeLayout==================
  GetPage(name: AppRoute.layout, page: () =>  const LayoutScreen()),
  GetPage(name: AppRoute.home, page: () =>  const HomeScreen()),
  GetPage(name: AppRoute.category, page: () =>  const CategoryScreen()),
  GetPage(name: AppRoute.cart, page: () =>  const CartScreen()),
  GetPage(name: AppRoute.favorite, page: () =>  const FavoriteScreen()),
  GetPage(name: AppRoute.settings, page: () =>   SettingsScreen()),
  GetPage(name: AppRoute.onBoarding, page: () =>  const OnBoardingScreen()),

  // GetPage(name: AppRoute.profile, page: () =>  const ProfileScreen()),
  //=========================product========================
  GetPage(name: AppRoute.product, page: () =>  const ProductScreen()),
  GetPage(name: AppRoute.productDetails, page: () =>   ProductDetailsScreen()),
  GetPage(name: AppRoute.productCategory, page: () =>  const ProductCategoryScreen()),


  GetPage(name: AppRoute.profile, page: () =>   const ProfileScreen()),



  // GetPage(name: AppRoute.productDetailsSearch, page: () =>   const ProductDetailsSearch()),


  //=========================Address========================

  GetPage(name: AppRoute.addressView, page: () =>   const AddressScreen()),

  GetPage(name: AppRoute.addressAdd, page: () =>   const AddressAdd()),

  GetPage(name: AppRoute.map, page: () =>   const MapScreen()),

  GetPage(name: AppRoute.addressUpdate, page: () =>   const AddressUpdate()),


  //=========================Order========================

  GetPage(name: AppRoute.checkout, page: () =>   const CheckoutScreen()),


  GetPage(name: AppRoute.orderPending, page: () =>  const OrderPending()),

  GetPage(name: AppRoute.ordersRating, page: () =>  const OrdersRating()),

  //============================Admin=====================
  GetPage(name: AppRoute.homeAdmin, page: () =>  const HomeAdmin()),
       //categories
  GetPage(name: AppRoute.categoriesView, page: () =>  const CategoriesView()),

  GetPage(name: AppRoute.categoriesAdd, page: () =>  const AddCategories()),

  GetPage(name: AppRoute.categoriesUpdate, page: () =>  const UpdateCategories()),


];
