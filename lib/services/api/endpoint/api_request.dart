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
          onResponse: (response, handler) async {
            CustomException? handledError;
            String message = "";
            if (!(response.statusCode == 200 || response.statusCode == 201)) {
              message = response.data;
              printMsg(response);
              handledError = CustomException(message: message, statusCode: 400);
            }
            return handledError != null ? handler.reject(handledError) : handler.next(response);
          },
        ),
      );
  }
}
