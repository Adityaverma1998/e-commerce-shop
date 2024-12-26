import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/features/product/presentation/bloc/product_bloc.dart';
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
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            // Display the list of products
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price.toString()}'),
                  trailing: Text('Category: ${product.category}'),
                );
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
    );
  }
}
