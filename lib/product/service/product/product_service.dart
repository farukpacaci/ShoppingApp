import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shop_app/product/config/dio_config.dart';
import 'package:shop_app/product/model/product/product.dart';
import 'package:shop_app/product/service/network_error.dart';

/// Product service for API calls
class ProductService extends DioConfig {
  /// Constructor for [ProductService] class with [super] keyword
  ProductService() : super();

  /// Get all products from API
  Future<List<Product>> getAllProducts() async {
    try {
      final response = await dio.get<List<dynamic>>(
        '/products',
        options: Options(
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );

      switch (response.statusCode) {
        case HttpStatus.ok:
          return response.data!
              .map(
                (jsonProduct) =>
                    Product.fromJson(jsonProduct as Map<String, dynamic>),
              )
              .toList();
        default:
          return [];
      }
    } on NetworkError catch (e) {
      throw NetworkError(e.toString());
    }
  }

  /// Get product by id from API
  Future<List<Product>> getProduct(int id) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '/products/$id',
        options: Options(
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );

      switch (response.statusCode) {
        case HttpStatus.ok:
          return [Product.fromJson(response.data!)];
        default:
          return [];
      }
    } on NetworkError catch (e) {
      throw NetworkError(e.toString());
    }
  }
}
