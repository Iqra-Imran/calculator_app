// lib/screens/cart_screen.dart
import 'package:calculator/cart_task_with_api/models/cart_product_model.dart';
import 'package:calculator/cart_task_with_api/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: cart.items.isEmpty
          ? const Center(child: Text('Your cart is empty!'))
          : ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final product = cart.items.values.toList()[index];
          return CartItem(product: product);
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final ProductModel product;

  const CartItem({required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return ListTile(
      leading: Image.network(
        product.image,
        height: 50,
        width: 50,
      ),
      title: Text(product.title),
      subtitle: Text('\$${product.price}'),
      trailing: IconButton(
        icon: const Icon(Icons.remove_shopping_cart, color: Colors.red),
        onPressed: () {
          cart.remove(product);
        },
      ),
    );
  }
}
