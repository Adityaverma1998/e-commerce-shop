
import 'package:ecoomerce_shop/core/db/db_helper.dart';
import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/features/product/data/dataSources/local/product_local_data_source.dart';

mixin ProductLocalModule{
    static Future<void> configureProductLocalModuleInjection() async {
     
     // Local database dependencies
    getIt.registerSingleton(
      ProductLocalDataSource(dbHelper:  getIt<DBHelper>()),
    );
    }

} 