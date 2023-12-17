import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/home/home_state.dart';
import 'package:shop_app/product/service/product/product_service.dart';

/// Home cubit
class HomeCubit extends Cubit<HomeState> {
  /// Constructor
  HomeCubit(this._productService) : super(const HomeInitial()) {
    getAllProducts();
  }

  final ProductService _productService;

  /// Get all products from API
  Future<void> getAllProducts() async {
    emit(const HomeLoading());
    final response = await _productService.getAllProducts();
    if (response is Exception) {
      emit(HomeError(response.toString()));
    }
    emit(HomeLoaded(response));
  }
}
