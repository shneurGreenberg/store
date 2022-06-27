// ignore_for_file: avoid_print
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:store/models/products_model.dart';
import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  final Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
    _items.putIfAbsent(product.id!, () {
      print('add item' + product.id!.toString() + ' ' + quantity.toString());
      _items
          .forEach((key, value) => print("object" + value.quantity.toString()));
      return CartModel(
          id: product.id,
          name: product.name,
          price: product.price,
          img: product.img,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString());
    });
  }
}
