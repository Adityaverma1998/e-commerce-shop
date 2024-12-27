import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/features/product/domain/usecase/get_product_details_usecase.dart';
import 'package:ecoomerce_shop/features/product/domain/usecase/get_products_usecase.dart';
import 'package:ecoomerce_shop/features/product/presentation/bloc/product_bloc.dart';

mixin ProductStoreModule {
  static Future<void> configureProductStoreModuleInjection() async {
    // Registering the ProductBloc with its dependency
    getIt.registerSingleton<ProductBloc>(
      ProductBloc(
        getProductUsecase: getIt<GetProductUsecase>(),
        getProductDetailsUsecase:getIt<GetProductDetailsUsecase>(),
      ),
    );
  }
}
