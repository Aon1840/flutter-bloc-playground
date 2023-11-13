import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver { // ไม่ได้ใช้ ไปใช้ overide ใน CounterABloc
  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    print("AppBlocObserver $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}
