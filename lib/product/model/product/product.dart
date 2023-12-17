import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

/*
{
"id": 1,
"title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
"price": 109.95,
"description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
"category": "men's clothing",
"image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
"rating": {
"rate": 3.9,
"count": 120
}
},


 */

/// Product model
@JsonSerializable()
class Product {
  /// Factory constructor for [Product] class
  /// Convert json data to [Product] instance
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  /// Map the [Product] instance to json data
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  /// Constructor for [Product] class
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  /// Factory constructor id for [Product] class
  final int id;

  /// Factory constructor title for [Product] class
  final String title;

  /// Factory constructor price for [Product] class
  final num price;

  /// Factory constructor category for [Product] class
  final String category;

  /// Factory constructor description for [Product] class
  final String description;

  /// Factory constructor image for [Product] class
  final String image;
}
