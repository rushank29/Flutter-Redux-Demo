import 'dart:io';
import 'package:flutter_redux_demo/screens/redux_counter_demo/model/counter_state.dart';
import 'package:flutter_redux_demo/screens/redux_counter_demo/reducer/app_reducer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'app_state.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/state.json');
}

Future<Store<AppState>> createStore() async {
  // Create Persistor
  final persistor = Persistor<AppState>(
    storage: FileStorage(await _localFile),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
    debug: true,
  );

  // Loading initial state
  dynamic initialState;
  try {
    initialState = await persistor.load();
    print("Initial state ===========> $initialState");
    print("Local file =========> ${FileStorage(await _localFile).file}");
    print("File data =========> ${await FileStorage(await _localFile).file.readAsString()}");
  } catch (e) {
    initialState = null;
    print("Initial state is set to null and following error occurred ===========> $e");
  }

  return Store(
    appReducer,
    initialState: initialState ??
        AppState(
          counterState: CounterState(
            count: 0,
            totalActions: 0,
            lastActionPerformed: CounterActions.reset.name,
          ),
        ),
    middleware: [persistor.createMiddleware()],
  );
}

late Store<AppState> store;

Future<void> initStore() async {
  store = await createStore();
}

Store<AppState> getStore() {
  return store;
}
