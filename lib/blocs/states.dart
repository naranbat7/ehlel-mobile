import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  const MainState([List props = const []]) : super();
}

class MainInitial extends MainState {
  @override
  List<Object?> get props => [];
}

class MainLoading extends MainState {
  @override
  List<Object?> get props => [];
}

class MainFailure extends MainState {
  final String error;

  MainFailure({required this.error}) : super([error]);

  @override
  List<Object?> get props => [];
}

class MainSuccessful extends MainState {
  @override
  List<Object?> get props => [];
}

class MainOrderSuccessful extends MainState {
  final String url;

  const MainOrderSuccessful(this.url) : super();

  @override
  List<Object?> get props => [];
}
