import 'package:get/get.dart';
import 'package:store/data/api/api_client.dart';
import 'package:store/utils/app_constans.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstans.POPULAR_PRODUCT_URI);
  }
}
