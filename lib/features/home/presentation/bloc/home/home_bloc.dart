import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LatestCounterValue(counter: 0)) {
    // Register event handlers using the `on` method
    on<IncreaseCounterEvent>((event, emit) {
      // Increment counter and emit new state
      final currentCounterValue = (state as LatestCounterValue).counter;
      emit(LatestCounterValue(counter: currentCounterValue + 1));
    });

    on<DecreaseCounterEvent>((event, emit) {
      // Decrement counter and emit new state
      final currentCounterValue = (state as LatestCounterValue).counter;
      emit(LatestCounterValue(counter: currentCounterValue - 1));
    });

   
  }
  
}
