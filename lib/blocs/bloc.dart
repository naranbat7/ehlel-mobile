import 'package:dio/dio.dart';
import 'package:ehlel/blocs/index.dart';
import 'package:ehlel/global_keys.dart';
import 'package:ehlel/models/address/index.dart';
import 'package:ehlel/models/cart/index.dart';
import 'package:ehlel/models/category/index.dart';
import 'package:ehlel/models/product/index.dart';
import 'package:ehlel/models/user/index.dart';
import 'package:ehlel/providers/index.dart';
import 'package:ehlel/services/api/helper/api_helper.dart';
import 'package:ehlel/services/debug/index.dart';
import 'package:ehlel/services/exception/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial());

  static MainBloc get bloc => BlocProvider.of<MainBloc>(GlobalKeys.navigatorKey.currentContext!);

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is UserLogin) {
      yield MainLoading();
      try {
        Response res = await ApiHelper.loginUser(event.email, event.password);
        MainProvider.provider.setUser(UserModel.fromJson(res.data));
        yield MainSuccessful();
      } on CustomException catch (ex) {
        printMsg("error: " + ex.message);
        yield MainFailure(error: ex.message);
      } catch (ex) {
        printMsg("error: " + ex.toString());
        yield MainFailure(error: "Алдаа гарлаа.");
      }
    } else if (event is UserRegister) {
      yield MainLoading();
      try {
        Response res = await ApiHelper.registerUser(event.firstname, event.lastname, event.phone, event.email, event.password);
        MainProvider.provider.setUser(UserModel.fromJson(res.data));
        yield MainSuccessful();
      } on CustomException catch (ex) {
        printMsg("error: " + ex.message);
        yield MainFailure(error: ex.message);
      } catch (ex) {
        printMsg("error: " + ex.toString());
        yield MainFailure(error: "Алдаа гарлаа.");
      }
    } else if (event is GetProductList) {
      yield MainLoading();
      try {
        Response res = await ApiHelper.productList();
        MainProvider.provider.setProducts(ProductModel.fromList(res.data));
        yield MainSuccessful();
      } on CustomException catch (ex) {
        printMsg("error: " + ex.message);
        yield MainFailure(error: ex.message);
      } catch (ex) {
        printMsg("error: " + ex.toString());
        yield MainFailure(error: "Алдаа гарлаа.");
      }
    } else if (event is GetCategoryList) {
      yield MainLoading();
      try {
        Response res = await ApiHelper.categoryList();
        MainProvider.provider.setCategories(CategoryModel.fromList(res.data));
        yield MainSuccessful();
      } on CustomException catch (ex) {
        printMsg("error: " + ex.message);
        yield MainFailure(error: ex.message);
      } catch (ex) {
        printMsg("error: " + ex.toString());
        yield MainFailure(error: "Алдаа гарлаа.");
      }
    } else if (event is GetCategoryProducts) {
      yield MainLoading();
      try {
        Response res = await ApiHelper.categoryProductList(event.id);
        MainProvider.provider.setCategoryProducts(event.id, ProductModel.fromList(res.data['products']));
        yield MainSuccessful();
      } on CustomException catch (ex) {
        printMsg("error: " + ex.message);
        yield MainFailure(error: ex.message);
      } catch (ex) {
        printMsg("error: " + ex.toString());
        yield MainFailure(error: "Алдаа гарлаа.");
      }
    } else if (event is GetCart) {
      yield MainLoading();
      try {
        Response res = await ApiHelper.cartInfo();
        MainProvider.provider.setCart(CartModel.fromJson(res.data));
        yield MainSuccessful();
      } on CustomException catch (ex) {
        printMsg("error: " + ex.message);
        yield MainFailure(error: ex.message);
      } catch (ex) {
        printMsg("error: " + ex.toString());
        yield MainFailure(error: "Алдаа гарлаа.");
      }
    } else if (event is UpdateCart) {
      yield MainLoading();
      try {
        await ApiHelper.updateCartInfo(MainProvider.provider.cart);
        yield MainSuccessful();
      } on CustomException catch (ex) {
        printMsg("error: " + ex.message);
        yield MainFailure(error: ex.message);
      } catch (ex) {
        printMsg("error: " + ex.toString());
        yield MainFailure(error: "Алдаа гарлаа.");
      }
    } else if (event is GetAddress) {
      yield MainLoading();
      try {
        Response res = await ApiHelper.addressList();
        MainProvider.provider.setAddress(AddressModel.fromList(res.data));
        yield MainSuccessful();
      } on CustomException catch (ex) {
        printMsg("error: " + ex.message);
        yield MainFailure(error: ex.message);
      } catch (ex) {
        printMsg("error: " + ex.toString());
        yield MainFailure(error: "Алдаа гарлаа.");
      }
    } else if (event is AddAddress) {
      yield MainLoading();
      try {
        await ApiHelper.addAddress(event.data);
        MainProvider.provider.addAddress(event.data);
        yield MainSuccessful();
      } on CustomException catch (ex) {
        printMsg("error: " + ex.message);
        yield MainFailure(error: ex.message);
      } catch (ex) {
        printMsg("error: " + ex.toString());
        yield MainFailure(error: "Алдаа гарлаа.");
      }
    }
  }
}
