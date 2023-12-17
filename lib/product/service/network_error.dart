import 'dart:io';

/// Network error for API calls
class NetworkError extends HttpException {
  /// Constructor for the NetworkError class
  NetworkError(this.message) : super(message);

  /// Message for the NetworkError class
  final String message;
}
