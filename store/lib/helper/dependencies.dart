import 'package:get/get.dart';

import '../controllers/popular_product_controller.dart';
import '../data/Repository/popular_product_repo.dart';
import '../data/api/api_client.dart';
import '../utils/app_constans.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstans.BASE_URL));

  // repository

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
