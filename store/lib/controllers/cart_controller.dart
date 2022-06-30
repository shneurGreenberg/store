// ignore_for_file: avoid_print
import 'dart:ui';
import 'package:get/get.dart';
import 'package:store/models/products_model.dart';
import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  // Storing the data of cart in this list
  final Map<int, CartModel> _items = {};
  // Make data from the cart available to the all app through get method
  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantety = 0;
    _items.containsKey(product.id!)
        ? {
            // update item in list
            _items.update(product.id!, (value) {
              totalQuantety = value.quantity! + quantity;
              return CartModel(
                id: value.id,
                name: value.name,
                price: value.price,
                img: value.img,
                quantity: value.quantity! + quantity,
                isExist: true,
                time: DateTime.now().toString(),
                product: product,
              );
            }),
            if (totalQuantety <= 0) {_items.remove(product.id)}
          }
        : {
            // add new item to list
            quantity > 0
                ? {
                    _items.putIfAbsent(
                      product.id!,
                      () => CartModel(
                        id: product.id,
                        name: product.name,
                        price: product.price,
                        img: product.img,
                        quantity: quantity,
                        isExist: true,
                        time: DateTime.now().toString(),
                        product: product,
                      ),
                    )
                  }
                : {
                    Get.snackbar(
                      'Error',
                      'You need to add at least one item to the card',
                      backgroundColor: AppColors.mainColor,
                      colorText: const Color.fromARGB(255, 234, 61, 61),
                    )
                  }
          };
    update();
  }

  existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

// return the sum number of all the item in cart
  get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

// get a list of all items in cart
// its convert the map to list to get item by index and not by key
  List<CartModel> get getAllItems =>
      _items.entries.map((e) => e.value).toList();

  int get totalPrice {
    var totalPrice = 0;
    _items
        .forEach((key, value) => totalPrice += value.price! * value.quantity!);
    return totalPrice;
  }
}
