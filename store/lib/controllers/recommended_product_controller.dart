// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:store/models/products_model.dart';
import '../data/Repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList = [];

  // get make this list accessible from outside this class
  List<ProductModel> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

// function that will fetch the recommended product list from the server
  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    // check if the response is successful
    if (response.statusCode == 200) {
      _isLoaded = true;
      _recommendedProductList = [];
      _recommendedProductList
          .addAll(Product.fromJson(response.body).productlist);

      update();
    } else {
      print(' 3 $response');
    }
  }
}
