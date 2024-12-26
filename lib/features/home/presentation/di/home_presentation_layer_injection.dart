
import 'package:ecoomerce_shop/features/home/presentation/di/store_module/store_module.dart';

mixin HomePresentationLayerInjection {
  static Future<void> configureHomePresentationLayerInjection() async {
    await StoreModule.configureHomeStoreModuleInjection();
  }
}
