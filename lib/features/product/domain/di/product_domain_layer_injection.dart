import 'package:ecoomerce_shop/features/product/domain/di/module/usecase_module.dart';

mixin ProductDomainLayerInjection {
  static Future<void> configureProductDomainLayerInjection() async {
    await UseCaseModule.configureUseCaseModuleInjection();
  }
}
