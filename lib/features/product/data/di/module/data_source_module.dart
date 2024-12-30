import 'package:ecoomerce_shop/core/db/db_helper.dart';
import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/core/network_client/dio_client.dart';
import 'package:ecoomerce_shop/features/product/data/dataSources/local/product_local_data_source.dart';
import 'package:ecoomerce_shop/features/product/data/dataSources/remote/remote_repositories/product_remote_data_source.dart';

mixin NetworkModule {
  static Future<void> configureProductDataSourceModuleInjection() async {
  

        // api's:-------------------------------------------------------------------
    // API dependencies
    getIt.registerSingleton(ProductRemoteDataSource(getIt<DioClient>()));

    
  }
}
