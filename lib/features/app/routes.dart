import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:ecoomerce_shop/features/home/presentation/screen/home.dart';
import 'package:ecoomerce_shop/features/product/presentation/bloc/product_bloc.dart';
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
                                       
                ..add(FetchProducts(products: [])),

                   child: const ProductScreen(), // Use the appropriate screen widget
            );
          },
      )
    ]
    );
  }
}