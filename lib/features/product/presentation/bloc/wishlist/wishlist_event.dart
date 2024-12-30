part of 'wishlist_bloc.dart';

abstract class WishlistEvent {}

class AddToWishlistEvent extends WishlistEvent{
  final AddWishlistParams params;
AddToWishlistEvent({required this.params});

}