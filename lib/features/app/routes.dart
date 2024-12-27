import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecoomerce_shop/features/product/presentation/screen/product_detail.dart';
import 'package:ecoomerce_shop/features/product/presentation/screen/products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  GoRouter generateRouter(GlobalKey<NavigatorState> navigatorKey) {
    return GoRouter(
      navigatorKey: navigatorKey, // Use the navigatorKey passed to AppRouter
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return BlocProvider.value(
              value: getIt<ProductBloc>() // Inject ProductBloc instance using service locator
                ..add(FetchProducts()),

              child: const ProductScreen(),
            );
          },
        ),
        GoRoute(
          path: '/productDetails/:id', // Define the route with product ID
          builder: (context, state) {
            final int productId = int.parse(state.pathParameters['id']!);

            return BlocProvider.value(
              value: getIt<ProductBloc>() // Inject ProductBloc using service locator
                ..add(FetchProductDetails(productId: productId)),

              child: ProductDetails(productId: productId),
            );
          },
        ),
      ],
    );
  }
}
