import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

/// Product model
@JsonSerializable()
class Product {

  /// Constructor for [Product] class
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });
  /// Factory constructor for [Product] class
  /// Convert json data to [Product] instance
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  /// Map the [Product] instance to json data
  Map<String, dynamic> toJson() => _$ProductToJson(this);

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
