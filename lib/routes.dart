import 'package:flutter/widgets.dart';
import 'package:jj_vr/screens/autre_page/store/store_screen.dart';
import 'package:jj_vr/screens/bottomNavigationBar/Chat/chat_screen.dart';
import 'package:jj_vr/screens/bottomNavigationBar/favourite/favorite_screen.dart';
import 'package:jj_vr/screens/bottomNavigationBar/home/cart/cart_screen.dart';
import 'package:jj_vr/screens/bottomNavigationBar/home/home_page/home_screen.dart';
import 'package:jj_vr/screens/bottomNavigationBar/home/notification/notification_screen.dart';
import 'package:jj_vr/screens/bottomNavigationBar/profile/my_seller_account/my_seller_account.dart';
import 'package:jj_vr/screens/bottomNavigationBar/profile/my_user_account/my_user_account.dart';
import 'package:jj_vr/screens/bottomNavigationBar/profile/profile_page/profile_screen.dart';
import 'package:jj_vr/screens/bottomNavigationBar/profile/settings/settings_screen.dart';
import 'package:jj_vr/screens/inscription/complete_profile/complete_profile_screen.dart';
import 'package:jj_vr/screens/autre_page/details/details_screen.dart';
import 'package:jj_vr/screens/inscription/forgot_password/forgot_password_screen.dart';
import 'package:jj_vr/screens/inscription/login_success/login_success_screen.dart';
import 'package:jj_vr/screens/inscription/sign_in/sign_in_screen.dart';
import 'package:jj_vr/screens/inscription/sign_up/sign_up_screen.dart';
import 'package:jj_vr/screens/inscription/otp/otp_screen.dart';
import 'package:jj_vr/screens/welcome/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  NotifScreen.routeName: (context) => NotifScreen(),
  FavoriteScreen.routeName: (context) => FavoriteScreen(),
  ChatScreen.routeName: (context) => ChatScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  StoreScreen.routeName: (context) => StoreScreen(),
  MySellerAccountScreen.routeName: (context) => MySellerAccountScreen(),
  SettingsPageScreen.routeName: (context) => SettingsPageScreen(),
  Statistique.routeName: (context) => Statistique(),
  Portefeuille.routeName: (context) => Portefeuille(),
  MyUserAccountScreen.routeName: (context) => MyUserAccountScreen(),
};
