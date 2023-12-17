import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shop_app/product/config/dio_config.dart';
import 'package:shop_app/product/model/product/product.dart';
import 'package:shop_app/product/service/network_error.dart';

/// Product service for API calls
class ProductService extends DioConfig {
  /// Constructor for [ProductService] class with [super] keyword
  ProductService() : super();

  final String _baseUrl = dotenv.env['BASE_URL']!;

  /// Get all products from API
  Future<List<Product>> getAllProducts() async {
    try {
      final response = await Dio().get<List<dynamic>>(
        '$_baseUrl/products',
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
      final response = await Dio().get<List<Product>>(
        'https://fakestoreapi.com/products/$id',
        options: Options(
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );

      switch (response.statusCode) {
        case HttpStatus.ok:
          return [Product.fromJson(response.data! as Map<String, dynamic>)];
        default:
          return [];
      }
    } catch (e) {
      throw Error();
    }
  }
}
