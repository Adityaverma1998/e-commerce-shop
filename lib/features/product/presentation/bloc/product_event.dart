part of 'product_bloc.dart';



abstract class ProductEvent{}

 class FetchProducts extends ProductEvent{

  final List<Product> products;
  FetchProducts({required this.products});
}