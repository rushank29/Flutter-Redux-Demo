import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/screens/redux_demo/counter_state.dart';
import 'package:flutter_redux_demo/screens/redux_demo/counter_state_model.dart';
import 'package:flutter_redux_demo/screens/redux_demo/redux_second_page.dart';

class ReduxHomePage extends StatefulWidget {
  const ReduxHomePage({super.key});

  @override
  State<ReduxHomePage> createState() => _ReduxHomePageState();
}

class _ReduxHomePageState extends State<ReduxHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redux Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReduxSecondPage(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StoreConnector<CounterStateModel, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(CounterActions.decrement);
                },
                builder: (context, callback) {
                  return FloatingActionButton(
                    heroTag: 'Dec',
                    onPressed: callback,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  );
                },
              ),
              StoreConnector<CounterStateModel, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(CounterActions.reset);
                },
                builder: (context, callback) {
                  return FloatingActionButton(
                    onPressed: callback,
                    heroTag: 'Res',
                    tooltip: 'Reset',
                    child: const Icon(Icons.restart_alt),
                  );
                },
              ),
              StoreConnector<CounterStateModel, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(CounterActions.increment);
                },
                builder: (context, callback) {
                  return FloatingActionButton(
                    onPressed: callback,
                    heroTag: 'Inc',
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          StoreConnector<CounterStateModel, String>(
            converter: (store) => store.state.count.toString(),
            builder: (context, count) {
              return Center(
                child: Text("Count: $count."),
              );
            },
          ),
          StoreConnector<CounterStateModel, String>(
            converter: (store) => store.state.totalActions.toString(),
            builder: (context, totalActions) {
              return Center(
                child: Text("Total actions: $totalActions."),
              );
            },
          ),
          StoreConnector<CounterStateModel, String>(
            converter: (store) => store.state.lastActionPerformed.toString(),
            builder: (context, lastActionPerformed) {
              return Center(
                child: Text("Last action performed: $lastActionPerformed."),
              );
            },
          ),
        ],
      ),
    );
  }
}
