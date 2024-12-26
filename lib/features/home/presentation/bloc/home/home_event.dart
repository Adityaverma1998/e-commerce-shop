
part of "home_bloc.dart";

abstract class HomeEvent extends Equatable{} 

class DecreaseCounterEvent extends HomeEvent{
  @override
  List<Object> get props => [];

  
}

class IncreaseCounterEvent extends HomeEvent{


  @override
  List<Object> get props => [];
}

class FetchNewsEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}