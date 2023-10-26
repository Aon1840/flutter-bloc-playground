import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_playground/src/bloc/counter_a_bloc/counter_a_bloc.dart';

import '../bloc/counter_b_bloc/counter_b_bloc.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'CounterA:',
                ),
                BlocBuilder<CounterABloc, CounterAState>(
                  builder: (context, stateA) {
                    return Text(
                      '${stateA.count}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'CounterB:',
                ),
                BlocListener<CounterBBloc, CounterBState>(
                  listener: (context, state) {
                    if (state.count == 10) {
                      debugPrint("Hello from listener");
                      Navigator.pop(context);
                    }
                  },
                  child: BlocBuilder<CounterBBloc, CounterBState>(
                    builder: (context, stateB) {
                      return Text(
                        '${stateB.count}',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'CounterC:',
                ),
                BlocConsumer<CounterBBloc, CounterBState>(
                  listener: (context, state) {
                    if (state.count == 6) {
                      debugPrint("Hello from consumer");
                    }
                  },
                  builder: (context, state) {
                      return Text(
                        '${state.count}',
                        style: Theme.of(context).textTheme.headline4,
                      );

                  }
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBBloc>().add(CounterBEventReset()),
            tooltip: 'Rest',
            child: const Icon(Icons.restore),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBBloc>().add(CounterBEventAdd()),
            tooltip: 'Add',
            child: const Icon(Icons.add),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
