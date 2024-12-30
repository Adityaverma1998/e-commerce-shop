import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/features/product/data/dataSources/local/product_local_data_source.dart';
import 'package:ecoomerce_shop/features/product/data/dataSources/remote/remote_repositories/product_remote_data_source.dart';
import 'package:ecoomerce_shop/features/product/data/repositories/product_repository_impl.dart';
import 'package:ecoomerce_shop/features/product/data/repositories/wishlists_repositroy_impl.dart';
import 'package:ecoomerce_shop/features/product/domain/repository/product_repository.dart';
import 'package:ecoomerce_shop/features/product/domain/repository/wishlist_repository.dart';

mixin RepositoryModule {
  static Future<void> configureProductRepositoryModuleInjection() async {
    getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(
      getIt<ProductRemoteDataSource>(),
     

    ));

    getIt.registerSingleton<WishlistRepository>(WishlistsRepositroyImpl(getIt<ProductLocalDataSource>()));
  }
  }