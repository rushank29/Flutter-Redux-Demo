import 'package:flutter/material.dart';
import 'package:flutter_redux_demo/screens/redux_demo/counter_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/screens/redux_demo/counter_state_model.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux_persist/redux_persist.dart';
import 'screens/redux_demo/redux_home_page.dart';
import 'package:redux/redux.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // // Create Persistor
  // final persistor = Persistor<CounterState>(
  //   storage: FlutterStorage(),
  //   serializer: JsonSerializer<CounterState>(CounterState.fromJson),
  // );
  //
  // // Load initial state
  // final initialState = await persistor.load();

  final initialState = CounterStateModel(
    count: 0,
    totalActions: 0,
    lastActionPerformed: null,
  );

  final store = Store<CounterStateModel>(
    counterReducer,
    initialState: initialState,
    // middleware: [persistor.createMiddleware()],
  );
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<CounterStateModel> store;

  const MyApp({super.key, required this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterStateModel>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        home: const ReduxHomePage(),
      ),
    );
  }
}
