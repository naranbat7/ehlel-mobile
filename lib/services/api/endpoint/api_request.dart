import 'package:dio/dio.dart';
import 'package:ehlel/services/api/helper/apis.dart';
import 'package:ehlel/services/debug/index.dart';
import 'package:ehlel/services/exception/index.dart';

class ApiRequest {
  static Dio instanceApi([String? baseUrl]) {
    var dio = Dio();
    dio.options
      ..contentType = "application/json"
      ..responseType = ResponseType.json
      ..baseUrl = baseUrl ?? Apis.BASE_URL
      ..connectTimeout = 30000 // 30s
      ..receiveTimeout = 30000 // 30s
      ..sendTimeout = 30000
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      };

    return _addInterceptors(dio);
  }

  static Dio _addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (error, handler) async {
            if (error.type == DioErrorType.connectTimeout || error.type == DioErrorType.receiveTimeout || error.type == DioErrorType.other) {
              return handler.next(CustomException(message: "Интернэт холболтоо шалгана уу"));
            } else {
              return handler.next(error);
            }
          },
          onResponse: (response, handler) async {
            CustomException? handledError;
            String message = "";
            if (response.statusCode == 500) {
              handledError = CustomException(message: "Сервертэй холбогдоход алдаа гарлаа", statusCode: response.statusCode);
            } else if (!(response.statusCode == 200 || response.statusCode == 201)) {
              message = response.data;
              printMsg("Aldaa: ");
              printMsg(response);
              handledError = CustomException(message: message, statusCode: 400);
            }
            return handledError != null ? handler.reject(handledError) : handler.next(response);
          },
        ),
      );
  }
}
