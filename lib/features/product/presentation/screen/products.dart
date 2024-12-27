import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecoomerce_shop/features/product/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // Used to access the ProductBloc from getIt (DI)
  final ProductBloc _productBloc = getIt<ProductBloc>();
  
  @override
  void initState() {
    super.initState();
    // Fetch products when the screen is initialized
    _productBloc.add(FetchProducts(products: []));
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose the Bloc if necessary (Not required in this case as we are using getIt)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              return GridView.builder(
                itemCount: state.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 8.0
                
                ),
                
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ProductCard(product: product);
                },
              );
            } else if (state is ProductError) {
              return Center(
                child: Text('Error: ${state.message}'),
              );
            } else {
              // Initial or unknown state
              return const Center(
                child: Text('No products available.'),
              );
            }
          },
        ),
      ),
    );
  }
}
