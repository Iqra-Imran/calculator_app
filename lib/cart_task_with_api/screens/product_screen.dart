// lib/screens/product_list_screen.dart
import 'package:calculator/cart_task_with_api/models/cart_product_model.dart';
import 'package:calculator/cart_task_with_api/provider/cart_provider.dart';
import 'package:calculator/cart_task_with_api/screens/cart_screens.dart';
import 'package:calculator/cart_task_with_api/services/cart_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  Future<List<ProductModel>> fetchProducts() {
    return ApiService.fetchStoreProducts();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
          Center(
            child: Text(
              'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ProductList(products: snapshot.data!);
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load products'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<ProductModel> products;

  ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          leading: Image.network(
            product.image,
            height: 50,
            width: 50,
          ),
          title: Text(product.title),
          subtitle: Text('\$${product.price}'),
          trailing: IconButton(
            icon: const Icon(Icons.add_shopping_cart, color: Colors.green),
            onPressed: () {
              cart.add(product);
            },
          ),
        );
      },
    );
  }
}
