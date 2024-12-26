import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/features/home/presentation/bloc/home/home_bloc.dart';

mixin StoreModule {
static Future<void> configureHomeStoreModuleInjection() async {

  getIt.registerSingleton<HomeBloc>(HomeBloc());
   
}
}