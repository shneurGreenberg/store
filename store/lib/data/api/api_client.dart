import "package:get/get.dart";
import 'package:store/utils/app_constans.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;
  // var corsAttr = EnableCorsAttribute("*","*","*");
  // config.EnableCors(corsAttr);

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstans.TOTEN;
    _mainHeaders = {
      "Content-Type": 'application/json; charset=utf-8',
      "Authorization": 'Bearer $token',
    };
  }
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri, headers: _mainHeaders);
      return response;
    } catch (err) {
      return Response(statusCode: 1, statusText: 'error is  $err');
    }
  }
}
