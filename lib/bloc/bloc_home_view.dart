import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/home_cubit.dart';
import 'package:shop_app/bloc/home_state.dart';
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
      child: buildScaffold(),
    );
  }

  Scaffold buildScaffold() {
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
            return buildLoaded(state);
          } else if (state is HomeError) {
            return CustomError(message: state.message);
          } else {
            return const CustomWentWrong();
          }
        },
      ),
    );
  }

  ListView buildLoaded(HomeLoaded state) {
    return ListView.builder(
      itemCount: state.products.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(state.products[index].title),
          subtitle: Text(state.products[index].description),
          leading: Image.network(state.products[index].image),
        );
      },
    );
  }
}
