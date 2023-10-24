import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_playground/src/bloc/counter_a_bloc/counter_a_bloc.dart';
import 'package:flutter_bloc_playground/src/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final counterABlocA =
        BlocProvider<CounterABloc>(create: (context) => CounterABloc());
    // final counterABlocB =
    //     BlocProvider<CounterABloc>(create: (context) => CounterABloc());

    return MultiBlocProvider(
      providers: [counterABlocA],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'HomePage'),
      ),
    );
  }
}
