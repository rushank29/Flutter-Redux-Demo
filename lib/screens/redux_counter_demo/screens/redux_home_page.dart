import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/screens/redux_counter_demo/actions/actions.dart';
import 'package:flutter_redux_demo/screens/redux_counter_demo/screens/redux_second_page.dart';
import 'package:flutter_redux_demo/screens/redux_counter_demo/store/app_state.dart';

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
              StoreConnector<AppState, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(DecrementAction());
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
              StoreConnector<AppState, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(ResetAction());
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
              StoreConnector<AppState, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(IncrementAction());
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
          StoreConnector<AppState, String>(
            converter: (store) => store.state.counterState.count.toString(),
            builder: (context, count) {
              return Center(
                child: Text("Count: $count."),
              );
            },
          ),
          StoreConnector<AppState, String>(
            converter: (store) => store.state.counterState.totalActions.toString(),
            builder: (context, totalActions) {
              return Center(
                child: Text("Total actions: $totalActions."),
              );
            },
          ),
          StoreConnector<AppState, String>(
            converter: (store) => store.state.counterState.lastActionPerformed.toString(),
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
