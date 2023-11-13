part of 'counter_b_bloc.dart';

abstract class CounterBEvent extends Equatable {
  @override
  List<Object?> get props => []; // บอกว่าไม่ต้องเทียบอะไร
  const CounterBEvent();
}

class CounterBEventAdd extends CounterBEvent {}

class CounterBEventReset extends CounterBEvent {}
