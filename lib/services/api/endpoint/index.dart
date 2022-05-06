import 'package:ehlel/providers/index.dart';
import 'package:ehlel/services/api/endpoint/api_request.dart';

class EndPoint {
  static String? get id => MainProvider.provider.user?.id;

  static getRequest({required String path}) async {
    return await ApiRequest.instanceApi().get(path);
  }

  static postRequest({required String path, data}) async {
    return await ApiRequest.instanceApi().post(path, data: data);
  }

  static putRequest({required String path, data}) async {
    return await ApiRequest.instanceApi().put(path, data: data);
  }

  static deleteRequest({required String path, data}) async {
    return await ApiRequest.instanceApi().delete(path, data: data);
  }
}
