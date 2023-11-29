import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/constant/routesname.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/sreen/auth/login.dart';
import 'view/sreen/auth/forgetpassword/resetpassword.dart';
import 'view/sreen/auth/signup.dart';
import 'view/sreen/auth/forgetpassword/forgetpassword.dart';
import 'view/sreen/auth/forgetpassword/successresretpassword.dart';
import 'view/sreen/auth/successsignup.dart';
import 'view/sreen/auth/forgetpassword/verifycode.dart';
import 'view/sreen/auth/verifycodesignup.dart';
import 'view/sreen/cart/cartpage.dart';
import 'view/sreen/checkout/checkoutpage.dart';
import 'view/sreen/home/homepage.dart';
import 'view/sreen/home/homescreen.dart';
import 'view/sreen/items/favoritespage.dart';
import 'view/sreen/items/itemsdetails.dart';
import 'view/sreen/items/itemspage.dart';
import 'view/sreen/language.dart';
import 'view/sreen/notifications/notificationspage.dart';
import 'view/sreen/onboarding.dart';
import 'view/sreen/orders/orderdetailspage.dart';
import 'view/sreen/orders/orderspage.dart';
import 'view/sreen/settings/addresses.dart';
import 'view/sreen/settings/settings.dart';
import 'view/sreen/tracking/trackingpage.dart';

List<GetPage<dynamic>>? routes = [
  //Racine
  // GetPage(name: "/", page: () => const HomeScreen()),
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleware()]),
  //Auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.successResetPasword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoutes.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  //Home
  GetPage(name: AppRoutes.homePage, page: () => const HomePage()),
  GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
  //Items
  GetPage(name: AppRoutes.itemsPage, page: () => const ItemsPage()),
  GetPage(name: AppRoutes.itemsDetails, page: () => const ItemsDetails()),
  //Favorites
  GetPage(name: AppRoutes.favoritesPage, page: () => const FavoritesPage()),
  //Cart
  GetPage(name: AppRoutes.cartPage, page: () => const CartPage()),
  //Settings
  GetPage(name: AppRoutes.settingsPage, page: () => const SettingsPage()),
  GetPage(name: AppRoutes.addressesPage, page: () => const AddressesPage()),
  //OnBoarding
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  //Check Out
  GetPage(name: AppRoutes.checkOutPage, page: () => const CheckOutPage()),
  //Orders
  GetPage(name: AppRoutes.ordersPage, page: () => const OrdersPage()),
  GetPage(
      name: AppRoutes.orderDetailsPage, page: () => const OderDetailsPage()),
  //Notifications
  GetPage(
      name: AppRoutes.notificationsPage, page: () => const NotificationsPage()),
  //Tracking
  GetPage(name: AppRoutes.trackingPage, page: () => const TrackingPage()),
];
