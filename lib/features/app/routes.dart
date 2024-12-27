import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecoomerce_shop/features/product/presentation/screen/product_detail.dart';
import 'package:ecoomerce_shop/features/product/presentation/screen/products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter{

  GoRouter generateRouter(){
    return GoRouter(
    routes: [
      GoRoute(path: '/',
       builder: (context, state) {
        
            return BlocProvider.value(
                                       value: getIt<ProductBloc>() // Inject HomeBloc instance using service locator
                                       
                ..add(FetchProducts()),

                   child: const ProductScreen(), // Use the appropriate screen widget
            );
          },
          
      ),
      GoRoute(
  path: '/productDetails/:id', // Define the route with product ID
  builder: (context, state) {
    // Extract product ID from the route
    final int productId = int.parse(state.pathParameters['id']!);

    // Provide the ProductBloc to the ProductScreen
    return BlocProvider.value(
      value: getIt<ProductBloc>() // Inject ProductBloc using service locator
        ..add(FetchProductDetails(productId: productId)), // Trigger FetchProductDetails with the product ID

      child: ProductDetails(productId: productId,), // Use the appropriate screen widget
    );
  },
),

    ]
    );
  }
}