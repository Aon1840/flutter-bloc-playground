part of 'counter_a_bloc.dart';

class CounterAState extends Equatable {
  final int count;

  const CounterAState({required this.count});

  CounterAState copyWith({int? count}) {
    return CounterAState(count: count ?? this.count); // ถ้ามีส่งมาใช้ค่า count ของ state ใหม่ ถ้าไม่ได้ส่งมาให้ใช้ของ state เดิม
  }

  @override
  List<Object> get props => [count];

  @override
  String toString() {
    return 'count: $count}';
  } // ถ้าอยากให้ค่ามันเปลี่ยนแล้ว ui เปลี่ยนด้วยต้องใส่ค่าในนี้


}
