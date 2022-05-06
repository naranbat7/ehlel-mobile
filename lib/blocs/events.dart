import 'package:ehlel/models/address/index.dart';
import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent([List props = const []]) : super();
}

class UserLogin extends MainEvent {
  final String email, password;

  UserLogin({required this.email, required this.password}) : super([]);

  @override
  List<Object?> get props => [];
}

class UserRegister extends MainEvent {
  final String lastname, firstname, phone, email, password;

  UserRegister({required this.lastname, required this.firstname, required this.phone, required this.email, required this.password}) : super([]);

  @override
  List<Object?> get props => [];
}

class GetProductList extends MainEvent {
  @override
  List<Object?> get props => [];
}

class GetCategoryList extends MainEvent {
  @override
  List<Object?> get props => [];
}

class GetCategoryProducts extends MainEvent {
  final String id;

  GetCategoryProducts(this.id) : super([]);

  @override
  List<Object?> get props => [];
}

class GetCart extends MainEvent {
  @override
  List<Object?> get props => [];
}

class UpdateCart extends MainEvent {
  @override
  List<Object?> get props => [];
}

class GetAddress extends MainEvent {
  @override
  List<Object?> get props => [];
}

class AddAddress extends MainEvent {
  final AddressModel data;

  AddAddress(this.data) : super([]);

  @override
  List<Object?> get props => [];
}
