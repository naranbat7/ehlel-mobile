import 'package:dio/dio.dart';

class CustomException extends DioError {
  final int? statusCode;

  CustomException({required String message, this.statusCode}) : super(error: message, requestOptions: RequestOptions(path: ""));
}
