import 'package:shop_app/product/model/product/product.dart';

/// Interface for the HomeState class
abstract class HomeState {
  /// Constructor for the HomeState class
  const HomeState();
}

/// Initial state for the HomeState class
class HomeInitial extends HomeState {
  /// Constructor for the HomeInitial class
  const HomeInitial();
}

/// Loading state for the HomeState class
class HomeLoading extends HomeState {
  /// Constructor for the HomeLoading class
  const HomeLoading();
}

/// Loaded state for the HomeState class
class HomeLoaded extends HomeState {
  /// Constructor for the HomeLoaded class
  const HomeLoaded(this.products);

  /// HomeLoaded sends the list of products to the UI
  final List<Product> products;
}

/// HomeError state for the HomeState class
class HomeError extends HomeState {
  /// Constructor for the HomeError class
  const HomeError(this.message);

  /// HomeError sends the error message to the UI
  final String message;
}
