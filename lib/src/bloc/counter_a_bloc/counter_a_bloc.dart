import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_a_event.dart';
part 'counter_a_state.dart';

class CounterABloc extends Bloc<CounterAEvent, CounterAState> {
  CounterABloc() : super(const CounterAState(count: 0)) {
    // Add event
    on<CounterAEventAdd>((event, emit) {
      // emit(CounterAState(count: state.count + 1)); ส่วนใหญ่จะไม่ assing ตรงๆ แต่จะเป็นการ assign state ใหม่เลย
      emit(state.copyWith(count: state.count + 1));
    });

    // Reset event
    on<CounterAEventReset>((event, emit) {
      emit(state.copyWith(count: 0));
    });
  }

  @override
  void onTransition(Transition<CounterAEvent, CounterAState> transition) {
    super.onTransition(transition);
    print("Transition $transition");
  }
}
