import 'package:dio/dio.dart';
import 'package:ehlel/models/address/index.dart';
import 'package:ehlel/models/cart/index.dart';
import 'package:ehlel/providers/index.dart';
import 'package:ehlel/services/api/endpoint/index.dart';
import 'package:ehlel/services/api/helper/apis.dart';

class ApiHelper {
  static Future<Response> loginUser(String email, String password) async {
    return await EndPoint.postRequest(path: Apis.LOGIN, data: {
      "email": email,
      "password": password,
    });
  }

  static Future<Response> registerUser(firstname, lastname, phone, email, password) async {
    return await EndPoint.postRequest(path: Apis.REGISTER, data: {
      "email": email,
      "password": password,
      "firstname": firstname,
      "lastname": lastname,
      "phone": phone,
    });
  }

  static Future<Response> productList() async {
    return await EndPoint.getRequest(path: Apis.PRODUCT);
  }

  static Future<Response> categoryList() async {
    return await EndPoint.getRequest(path: Apis.CATEGORY);
  }

  static Future<Response> categoryProductList(String id) async {
    return await EndPoint.getRequest(path: Apis.CATEGORY + "/$id");
  }

  static Future<Response> cartInfo() async {
    return await EndPoint.getRequest(path: Apis.CART + "/$_userId");
  }

  static Future<void> updateCartInfo(CartModel data) async {
    await EndPoint.putRequest(path: Apis.CART, data: data.toJson());
  }

  static Future<Response> addressList() async {
    return await EndPoint.getRequest(path: Apis.ADDRESS + "/$_userId");
  }

  static Future<Response> addAddress(AddressModel data) async {
    return await EndPoint.postRequest(path: Apis.ADDRESS, data: data.toJson());
  }

  static String? get _userId => MainProvider.provider.user?.id;
}
