import 'package:get/get.dart';
import 'package:getx_sample_ecommerce/model/products.dart';

class ShoppingController extends GetxController {
  var products = <Products>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Products(
          id: 1,
          productname: 'i Phone',
          productImage: "i phone image",
          productDescription: 'this iphone develeped by apple',
          price: 50000),
      Products(
          id: 2,
          productname: 'oneplus',
          productImage: "oneplus image",
          productDescription: 'this oneo plus develeped by oneplus team',
          price: 45000),
      Products(
          id: 3,
          productname: 'samsung',
          productImage: "samsung image",
          productDescription: 'this samsung develeped by samsung company',
          price: 55000),
      Products(
          id: 4,
          productname: 'Redmi',
          productImage: "Redmi image",
          productDescription: 'this Redmi develeped by xiaomi',
          price: 15000)
    ];
    products.value = productResult;
  }
}
