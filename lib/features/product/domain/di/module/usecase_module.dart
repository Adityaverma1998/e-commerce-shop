import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/features/product/domain/repository/product_repository.dart';
import 'package:ecoomerce_shop/features/product/domain/usecase/get_product_details_usecase.dart';
import 'package:ecoomerce_shop/features/product/domain/usecase/get_products_usecase.dart';

mixin UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    // user:--------------------------------------------------------------------
    
  getIt.registerSingleton<GetProductUsecase>(
      GetProductUsecase(getIt<ProductRepository>()),
    );  
    
    getIt.registerSingleton<GetProductDetailsUsecase>(
      GetProductDetailsUsecase(getIt<ProductRepository>()),
    );  
    }
}