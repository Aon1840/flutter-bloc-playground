import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_b_event.dart';
part 'counter_b_state.dart';

class CounterBBloc extends Bloc<CounterBEvent, CounterBState> {
  CounterBBloc() : super(const CounterBState(count: 0)) {
    // Add event
    on<CounterBEventAdd>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });

    // Reset event
    on<CounterBEventReset>((event, emit) {
      emit(state.copyWith(count: 0));
    });
  }

  @override
  void onTransition(Transition<CounterBEvent, CounterBState> transition) {
    super.onTransition(transition);
    print("Transition $transition");
  }
}
