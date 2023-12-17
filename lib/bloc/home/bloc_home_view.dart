import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/home/home_cubit.dart';
import 'package:shop_app/bloc/home/home_state.dart';
import 'package:shop_app/bloc/product_detail/bloc_product_detail_view.dart';
import 'package:shop_app/product/service/product/product_service.dart';
import 'package:shop_app/product/widget/state/custom_error.dart';
import 'package:shop_app/product/widget/state/custom_loading.dart';
import 'package:shop_app/product/widget/state/custom_went_wrong.dart';

/// Home view
class BlocHomeView extends StatefulWidget {
  /// Constructor
  const BlocHomeView({super.key});

  @override
  State<BlocHomeView> createState() => _BlocHomeViewState();
}

class _BlocHomeViewState extends State<BlocHomeView> {
  late ProductService productService;
  @override
  void initState() {
    super.initState();
    productService = ProductService();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (BuildContext context) => HomeCubit(ProductService()),
      child: buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, HomeState state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (BuildContext context, HomeState state) {
          if (state is HomeInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoading) {
            return const CustomLoading();
          } else if (state is HomeLoaded) {
            return buildLoaded(context, state);
          } else if (state is HomeError) {
            return CustomError(message: state.message);
          } else {
            return const CustomWentWrong();
          }
        },
      ),
    );
  }

  ListView buildLoaded(BuildContext context, HomeLoaded state) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: state.products.length,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => BlocProductDetailView(
                        productId: state.products[index].id,
                      ))),
          child: Container(
            height: screenWidth * 0.3 + 16,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    // Image of the product
                    Container(
                      width: screenWidth * 0.3,
                      height: screenWidth * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(state.products[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Product name and price
                    Container(
                      width: screenWidth * 0.6,
                      margin: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            state.products[index].title,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                          ),
                          Text(
                            state.products[index].description,
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
