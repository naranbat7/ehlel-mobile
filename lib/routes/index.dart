import 'package:ehlel/screens/auth/forgot_password/index.dart';
import 'package:ehlel/screens/auth/login/index.dart';
import 'package:ehlel/screens/auth/register/index.dart';
import 'package:ehlel/screens/main/add_address/index.dart';
import 'package:ehlel/screens/main/add_order/index.dart';
import 'package:ehlel/screens/main/address/index.dart';
import 'package:ehlel/screens/main/cart/index.dart';
import 'package:ehlel/screens/main/index.dart';
import 'package:ehlel/screens/main/notification/index.dart';
import 'package:flutter/material.dart';

const loginRoute = "login";
const registerRoute = "register";
const forgotPasswordRoute = "forgot_password";
const homeRoute = "home";
const notificationRoute = "notification";
const cartRoute = "cart";
const addressRoute = "address";
const addAddressRoute = "address/add";
const addOrderRoute = "order/add";

var routes = <String, WidgetBuilder>{
  loginRoute: (_) => const LoginPage(),
  registerRoute: (_) => const RegisterPage(),
  forgotPasswordRoute: (_) => const ForgotPasswordPage(),
  homeRoute: (_) => const MainPage(),
  notificationRoute: (_) => const NotificationPage(),
  cartRoute: (_) => const CartPage(),
  addressRoute: (_) => const AddressListPage(),
  addAddressRoute: (_) => const AddAddressPage(),
  addOrderRoute: (_) => const AddOrderPage(),
};
