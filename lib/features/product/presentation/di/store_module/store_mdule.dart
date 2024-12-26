import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/features/product/domain/usecase/get_products_usecase.dart';
import 'package:ecoomerce_shop/features/product/presentation/bloc/product_bloc.dart';

mixin ProductStoreModule {
  static Future<void> configureProductStoreModuleInjection() async {
    getIt.registerSingleton<ProductBloc>(
      ProductBloc(
        getIt<GetProductUsecase>(),
  }}