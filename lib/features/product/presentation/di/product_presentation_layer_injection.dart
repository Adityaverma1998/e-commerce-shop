import 'package:ecoomerce_shop/features/product/presentation/di/store_module/store_mdule.dart';

mixin ProductPresentationLayerInjection {
  static Future<void> configureProductPresentationLayerInjection() async {
    await ProductStoreModule.configureProductStoreModuleInjection();
  }
}
