
import 'package:ecoomerce_shop/features/home/presentation/di/home_presentation_layer_injection.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

mixin ServiceLocator{
 static Future<void> configureDependencies() async {
    
    await HomePresentationLayerInjection.configureHomePresentationLayerInjection();
  
 }
  }
