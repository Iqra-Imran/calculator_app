// lib/services/api_service.dart
import 'dart:convert';
import 'package:calculator/cart_task_with_api/models/cart_product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://fakestoreapi.com';

  static Future<List<ProductModel>> fetchStoreProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => ProductModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
