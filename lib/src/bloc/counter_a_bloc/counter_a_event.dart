part of 'counter_a_bloc.dart';

abstract class CounterAEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => []; // บอกว่าไม่ต้องเทียบอะไร

  const CounterAEvent();
}

class CounterAEventAdd extends CounterAEvent {}

class CounterAEventReset extends CounterAEvent {}