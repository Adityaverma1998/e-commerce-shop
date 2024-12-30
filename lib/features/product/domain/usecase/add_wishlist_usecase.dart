
import 'package:ecoomerce_shop/core/domain/usecase.dart';
import 'package:ecoomerce_shop/features/product/domain/repository/wishlist_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_wishlist_usecase.g.dart';

@JsonSerializable()
class AddWishlistParams{
  final int productId;
  final String title;
  final dynamic price;
  final String image;

  AddWishlistParams({required this.productId,required this.title,required this.price, required this.image});

  factory AddWishlistParams.fromJson(Map<String, dynamic> json) =>
      _$AddWishlistParamsFromJson(json);

  Map<String, dynamic> toJson() => _$AddWishlistParamsToJson(this);
}


class AddWishlistUsecase extends UseCase<String,AddWishlistParams>{
    final WishlistRepository _wishlistRepository;
  AddWishlistUsecase( this._wishlistRepository);

  @override
  Future<String> call addWishlists(AddWishlistParams params){
    return _wishlistRepository.addWishlist(params;)
  }
}