
import 'package:ecoomerce_shop/features/product/data/dataSources/local/product_local_data_source.dart';
import 'package:ecoomerce_shop/features/product/domain/repository/wishlist_repository.dart';
import 'package:ecoomerce_shop/features/product/domain/usecase/add_wishlist_usecase.dart';

class WishlistsRepositroyImpl extends WishlistRepository{
  final ProductLocalDataSource _productLocalDataSource;
  WishlistsRepositroyImpl(this._productLocalDataSource);

  @override
  Future<String> addWishlist(AddWishlistParams params) {
     return _productLocalDataSource.addToWishlist(params);
  }
}