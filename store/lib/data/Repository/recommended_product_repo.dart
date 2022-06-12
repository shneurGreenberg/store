import 'package:get/get.dart';
import 'package:store/data/api/api_client.dart';
import 'package:store/utils/app_constans.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstans.RECOMMENDED_PRODUCT_URI);
  }
}
