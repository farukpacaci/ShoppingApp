import 'package:shop_app/product/model/product/product.dart';

/// Interface for ProductDetailState
abstract class ProductDetailState {
  /// Default constructor
  const ProductDetailState();
}

/// Initial state for ProductDetailState
class ProductDetailInitial extends ProductDetailState {
  /// Default constructor
  const ProductDetailInitial();
}

/// Loading state for ProductDetailState
class ProductDetailLoading extends ProductDetailState {
  /// Default constructor
  const ProductDetailLoading();
}

/// Loaded state for ProductDetailState
class ProductDetailLoaded extends ProductDetailState {
  /// Default constructor
  const ProductDetailLoaded(this.product);

  /// Product
  final Product product;
}

/// Error state for ProductDetailState
class ProductDetailError extends ProductDetailState {
  /// Default constructor
  const ProductDetailError(this.message);

  /// Error message
  final String message;
}
