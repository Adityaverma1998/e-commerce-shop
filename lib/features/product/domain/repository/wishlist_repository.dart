
import 'package:ecoomerce_shop/features/product/domain/entity/product.dart';
import 'package:ecoomerce_shop/features/product/domain/usecase/add_wishlist_usecase.dart';




abstract class WishlistRepository{

  Future<String> addWishlist(AddWishlistParams params);

}