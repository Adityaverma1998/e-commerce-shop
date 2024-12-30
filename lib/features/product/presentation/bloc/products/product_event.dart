part of 'product_bloc.dart';



abstract class ProductEvent{}

 class FetchProducts extends ProductEvent{
 FetchProducts();
}
class FetchProductDetails extends ProductEvent {
  final int productId;

  FetchProductDetails({required this.productId});

  @override
  List<Object?> get props => [productId];
}