// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:store/models/products_model.dart';

import '../data/Repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];

  // get make this list accessible from outside this class
  List<ProductModel> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

// function that will fetch the popular product list from the server
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    // check if the response is successful
    if (response.statusCode == 200) {
      _isLoaded = true;
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).productlist);
      // print("print1" '1  $_popularProductList');
      // print("print1" + response.body);

      update();
    } else {
      print(' 3 $response');
    }
  }
}
