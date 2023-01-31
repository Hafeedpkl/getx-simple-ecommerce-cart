import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_ecommerce/controller/cart_controller.dart';
import 'package:getx_sample_ecommerce/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add to Cart'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].productname,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(controller
                                        .products[index].productDescription),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                children: [
                                  Text(
                                    '₹${controller.products[index].price}',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.blue),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        cartController.addToCart(
                                            controller.products[index]);
                                      },
                                      child: const Text('add')),
                                ],
                              ))
                            ],
                          )
                        ]),
                      ),
                    );
                  },
                );
              }),
            ),
            GetBuilder<CartController>(builder: (controller) {
              return Text(
                'Total amount:  ₹${controller.totalPrice}',
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              );
            }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.yellow,
        onPressed: () {},
        label: GetBuilder<CartController>(builder: (context) {
          return Text(
            cartController.count.toString(),
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          );
        }),
        icon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
