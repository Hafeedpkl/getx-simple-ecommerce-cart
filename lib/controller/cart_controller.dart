import 'package:get/get.dart';
import 'package:getx_sample_ecommerce/model/products.dart';

class CartController extends GetxController {
  var cartItems = <Products>[].obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Products product) {
    cartItems.add(product);
    update();
  }
}
