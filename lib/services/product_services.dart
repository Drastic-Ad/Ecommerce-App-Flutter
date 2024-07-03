// product_service.dart
import 'dart:convert';
import 'package:ecom_ui/models/product_model.dart';
import 'package:http/http.dart' as http;

// class ProductService {
//   final String apiUrl = "https://fakestoreapi.com/products/1";

//   Future<List<Product>> fetchProduct() async {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       return Product.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load product');
//     }
//   }
// }

class ProductService {
  final String apiUrl = "https://fakestoreapi.com/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
