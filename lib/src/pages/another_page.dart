import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_playground/src/bloc/counter_a_bloc/counter_a_bloc.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key, required this.title});

  final String title;

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'CounterA:',
            ),
            BlocBuilder<CounterABloc, CounterAState>(
              builder: (context, state) {
                return Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterABloc>().add(CounterAEventReset()),
            tooltip: 'Rest',
            child: const Icon(Icons.restore),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterABloc>().add(CounterAEventAdd()),
            tooltip: 'Add',
            child: const Icon(Icons.add),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
