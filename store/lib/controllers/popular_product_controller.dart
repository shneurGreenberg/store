// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controllers/cart_controller.dart';
import 'package:store/models/products_model.dart';
import 'package:store/utils/colors.dart';
import '../data/Repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [
    ProductModel(
        // id: 0,
        // name: '',
        // price: 0,
        // description: '',
        // stars: 0,
        // img: '',
        // location: '',
        // createdAt: '',
        // updatedAt: '',
        // typeId: 0,
        ),
  ];

  // get make this list accessible from outside this class
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

//  fetch the popular product list from the server
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

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      print('increment $_quantity');
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print('subtract $_quantity');
    }
    update();
  }

  //  if below zero then set it to zero
  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        'Error',
        'Quantity cannot be less than zero',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );

      return quantity = 0;
    } else if (quantity > 30) {
      Get.snackbar(
        'Error',
        'Quantity cannot be more than 30',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return quantity = 30;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    // update();
  }

  void addToCart(ProductModel product) {
    if (_quantity > 0) {
      _cart.addItem(product, _quantity);
    } else {
      Get.snackbar(
        'Error',
        'You need to add at least one item to the card',
        backgroundColor: AppColors.mainColor,
        colorText: const Color.fromARGB(255, 234, 61, 61),
      );
    }
  }
}
