import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/product_detail/product_detail_cubit.dart';
import 'package:shop_app/bloc/product_detail/product_detail_state.dart';
import 'package:shop_app/product/model/product/product.dart';
import 'package:shop_app/product/service/product/product_service.dart';
import 'package:shop_app/product/widget/state/custom_error.dart';
import 'package:shop_app/product/widget/state/custom_loading.dart';
import 'package:shop_app/product/widget/state/custom_went_wrong.dart';

/// ProductDetailView Widget
class BlocProductDetailView extends StatelessWidget {
  /// Default constructor
  const BlocProductDetailView({required this.productId, super.key});

  /// Need to get product by id from API
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailCubit(ProductService(), productId),
      child: buildScaffold(context),
    );
  }

  /// Build scaffold
  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<ProductDetailCubit, ProductDetailState>(
        listener: (context, state) {
          if (state is ProductDetailError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductDetailInitial) {
            return const CustomLoading();
          } else if (state is ProductDetailLoading) {
            return const CustomLoading();
          } else if (state is ProductDetailLoaded) {
            return _buildLoaded(state.product);
          } else if (state is ProductDetailError) {
            return CustomError(message: state.message);
          }
          return const CustomWentWrong();
        },
      ),
    );
  }

  SingleChildScrollView _buildLoaded(Product product) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Product title
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Product price
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Product description
                Text(
                  product.description[0].toUpperCase() +
                      product.description.substring(1),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
