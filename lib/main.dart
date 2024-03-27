import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/screens/redux_counter_demo/screens/redux_home_page.dart';
import 'package:flutter_redux_demo/screens/redux_counter_demo/store/app_state.dart';
import 'package:flutter_redux_demo/screens/redux_counter_demo/store/counter_store.dart';
import 'package:redux/redux.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initStore();
  final Store<AppState> store = getStore();
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
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
