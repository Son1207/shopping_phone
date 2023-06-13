import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';
import '../models/product_model.dart';


class CategoryProvider extends ChangeNotifier {
  Future<List<Category>> getCategory() async {
    const url = 'http://apiforlearning.zendvn.com/api/mobile/categories';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      List<Category> data = List<Category>.from(
          jsonData.map((cate) => Category.fromJson(jsonEncode(cate)))).toList();
      return data;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Product>> getProductCategory(int id) async {
    final url =
        'http://apiforlearning.zendvn.com/api/mobile/categories/$id/products';
    Uri uri = Uri.parse(url);
    final finalUri = uri.replace(queryParameters: {});
    try {
      final response = await http.get(finalUri);
      final jsonData = jsonDecode(response.body);
      List<Product> data = List<Product>.from(
          jsonData.map((product) => Product.fromJson(jsonEncode(product))))
          .toList();
      return data;
    } catch (e) {
      return Future.error(e);
    }
  }
}
