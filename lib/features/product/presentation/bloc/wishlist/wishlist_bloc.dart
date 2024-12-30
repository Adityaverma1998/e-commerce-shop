import 'package:bloc/bloc.dart';
import 'package:ecoomerce_shop/features/product/domain/usecase/add_wishlist_usecase.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
