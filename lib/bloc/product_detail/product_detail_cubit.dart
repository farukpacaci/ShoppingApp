import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/product_detail/product_detail_state.dart';
import 'package:shop_app/product/service/product/product_service.dart';

/// ProductDetailCubit
class ProductDetailCubit extends Cubit<ProductDetailState> {
  /// Default constructor
  ProductDetailCubit(this._productService, this.productId)
      : super(const ProductDetailInitial()) {
    getProduct(productId);
  }

  /// Product service for API calls
  final ProductService _productService;

  /// Product id to get specific product from API
  final int productId;

  /// Get product by id from API
  Future<void> getProduct(int productId) async {
    /// Set state to loading
    emit(const ProductDetailLoading());
    final response = await _productService.getProduct(productId);
    if (response is Exception) {
      emit(ProductDetailError(response.toString()));
    }
    emit(ProductDetailLoaded(response.first));
  }
}
