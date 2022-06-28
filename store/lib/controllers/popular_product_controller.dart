// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controllers/cart_controller.dart';
import 'package:store/models/products_model.dart';
import 'package:store/utils/colors.dart';
import '../data/Repository/popular_product_repo.dart';
import '../models/cart_model.dart';

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
    if (_inCartItems + quantity < 0) {
      Get.snackbar(
        'Error',
        'Quantity cannot be less than zero',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }

      return quantity = 0;
    } else if (_inCartItems + quantity > 30) {
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

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print('exist $exist');
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print('_inCartItems $_inCartItems');
  }

  // add the product to the cart
  void addToCart(ProductModel product) {
    _cart.addItem(product, _quantity);

    // reset the quantity so it will not add to cart again
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print(' id ${value.id} quantity ${value.quantity}');
    });
    update();
  }

  get totalItems => _cart.totalItems!;

  List<CartModel> get getAllItems => _cart.getAllItems;
}
