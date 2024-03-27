import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/screens/redux_demo/counter_state_model.dart';

class ReduxSecondPage extends StatefulWidget {
  const ReduxSecondPage({super.key});

  @override
  State<ReduxSecondPage> createState() => _ReduxSecondPageState();
}

class _ReduxSecondPageState extends State<ReduxSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Redux Second Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StoreConnector<CounterStateModel, String>(
            converter: (store) => store.state.count.toString(),
            builder: (context, count) {
              return Center(
                child: Text(
                  "Count: $count.",
                  style: const TextStyle(fontSize: 16),
                ),
              );
            },
          ),
          StoreConnector<CounterStateModel, String>(
            converter: (store) => store.state.totalActions.toString(),
            builder: (context, totalActions) {
              return Center(
                child: Text(
                  "Total actions: $totalActions.",
                  style: const TextStyle(fontSize: 16),
                ),
              );
            },
          ),
          StoreConnector<CounterStateModel, String>(
            converter: (store) => store.state.lastActionPerformed.toString(),
            builder: (context, lastActionPerformed) {
              return Center(
                child: Text(
                  "Last action performed: $lastActionPerformed.",
                  style: const TextStyle(fontSize: 16),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
