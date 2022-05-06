import 'package:ehlel/global_keys.dart';
import 'package:ehlel/models/address/index.dart';
import 'package:ehlel/models/cart/index.dart';
import 'package:ehlel/models/cart_item/index.dart';
import 'package:ehlel/models/category/index.dart';
import 'package:ehlel/models/product/index.dart';
import 'package:ehlel/models/user/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainProvider extends ChangeNotifier {
  UserModel? user;
  List<CategoryModel> categories = [];
  List<ProductModel> products = [];
  List<AddressModel> addresses = [];
  CartModel cart = CartModel();
  bool isLoading = false;

  MainProvider();

  List<ProductModel> searchProduct(String query) => products.where((element) => (element.title ?? '').contains(query)).toList();

  ProductModel? getProductById(String id) => products.any((e) => e.id == id) ? products.firstWhere((element) => element.id == id) : null;

  void addAddress(AddressModel data) {
    addresses.add(data);
    notifyListeners();
  }

  void setAddress(List<AddressModel> data) {
    addresses = data;
    notifyListeners();
  }

  void addCart(String id) {
    if ((cart.products ?? []).any((e) => e.product == id)) {
      int idx = cart.products!.indexWhere((e) => e.product == id);
      cart.products![idx].quantity = (cart.products![idx].quantity ?? 0) + 1;
    } else {
      cart.products ??= [];
      cart.products!.add(CartItemModel()
        ..product = id
        ..quantity = 0);
    }
    notifyListeners();
  }

  void removeCart(String id) {
    if ((cart.products ?? []).any((e) => e.product == id)) {
      int idx = cart.products!.indexWhere((e) => e.product == id);
      if (cart.products![idx].quantity == null || cart.products![idx].quantity! <= 1) {
        cart.products!.removeAt(idx);
      } else {
        cart.products![idx].quantity = cart.products![idx].quantity! - 1;
      }
      notifyListeners();
    }
  }

  void setCart(CartModel data) {
    cart = data;
    notifyListeners();
  }

  void setUser(UserModel user) {
    this.user = user;
    notifyListeners();
  }

  void setProducts(List<ProductModel> data) {
    products = data;
    notifyListeners();
  }

  void setCategories(List<CategoryModel> data) {
    categories = data;
    notifyListeners();
  }

  void setCategoryProducts(String id, List<ProductModel> data) {
    if (categories.any((e) => e.id == id)) {
      categories[categories.indexWhere((e) => e.id == id)].products = data;
      notifyListeners();
    }
  }

  void resetUser() {
    user = null;
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  static MainProvider get provider => Provider.of<MainProvider>(GlobalKeys.navigatorKey.currentContext!, listen: false);
}
