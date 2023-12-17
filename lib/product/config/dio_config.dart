import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shop_app/product/mixin/duration.dart';

/// Dio configuration
class DioConfig {
  /// Constructor
  DioConfig() {
    dio = Dio(
      BaseOptions(
        baseUrl: dotenv.get('BASE_URL'),
        sendTimeout: Durations.sendTimeout,
        receiveTimeout: Durations.receiveTimeout,
        
      ),
    );
  }

  /// Dio instance
  late Dio dio;
}
