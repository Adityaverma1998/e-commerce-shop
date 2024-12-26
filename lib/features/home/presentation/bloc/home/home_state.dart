part of "home_bloc.dart";

abstract class HomeState extends Equatable{}

class LatestCounterValue extends HomeState{
  final int counter;

   LatestCounterValue({required this.counter});
   
     @override
     List<Object?> get props => [counter];
}
class FetchProductsEvent extends HomeState{
  final List<dynamic> products;
  FetchProductsEvent({required this.products});
   @override
     List<Object?> get props => [products];
}