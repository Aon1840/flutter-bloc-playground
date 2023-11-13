part of 'counter_b_bloc.dart';

 class CounterBState extends Equatable {
   final int count;
  const CounterBState({required this.count});

   CounterBState copyWith({int? count}) {
     return CounterBState(count: count ?? this.count); // ถ้ามีส่งมาใช้ค่า count ของ state ใหม่ ถ้าไม่ได้ส่งมาให้ใช้ของ state เดิม
   }

  @override
  List<Object> get props => [count];

   @override
   String toString() {
     return 'count: $count}';
   } // ถ้าอยากให้ค่ามันเปลี่ยนแล้ว ui เปลี่ยนด้วยต้องใส่ค่าในนี้
}
