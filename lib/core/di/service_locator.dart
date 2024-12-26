
import 'package:ecoomerce_shop/features/home/presentation/di/home_presentation_layer_injection.dart';
import 'package:ecoomerce_shop/features/product/data/di/product_data_link_layer_injection.dart';
import 'package:ecoomerce_shop/features/product/domain/di/product_domain_layer_injection.dart';
import 'package:ecoomerce_shop/features/product/presentation/di/product_presentation_layer_injection.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

mixin ServiceLocator{
 static Future<void> configureDependencies() async {
    
    await HomePresentationLayerInjection.configureHomePresentationLayerInjection();



    //product 
    await ProductDataLayerInjection.configureProductDataLayerInjection();
        await  ProductDomainLayerInjection.configureProductDomainLayerInjection();

        await ProductPresentationLayerInjection.configureProductPresentationLayerInjection();

  
 }
  }
