import 'package:ecoomerce_shop/features/product/data/di/module/data_source_module.dart';
import 'package:ecoomerce_shop/features/product/data/di/module/respository_module.dart';

mixin ProductDataLayerInjection {
  static Future<void> configureProductDataLayerInjection() async {
    await NetworkModule.configureProductDataSourceModuleInjection();
    await RepositoryModule.configureProductRepositoryModuleInjection();
  }
}