import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/core/network_client/dio_client.dart';
import 'package:ecoomerce_shop/features/product/data/dataSources/remote/remote_repositories/product_remote_data_source.dart';

mixin NetworkModule {
  static Future<void> configureProductDataSourceModuleInjection() async {
    // Register DioClient as a singleton
    getIt.registerLazySingleton<DioClient>(() => DioClient());

        // api's:-------------------------------------------------------------------
     getIt.registerSingleton(ProductRemoteDataSource(getIt<DioClient>()));
  }
}
