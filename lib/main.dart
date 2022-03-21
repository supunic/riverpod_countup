import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/state/provider.dart';
import 'package:riverpod_countup/view_model/home_view_model.dart';

void main() {
  // MyApp 内で ProviderScope を使えるように wrap
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

// ConsumerStatefulWidget ... ConsumerState で ref がグローバルに使用可能
//                            state 変更時に rebuild は走ってしまうが、可読性がいい
class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();

    _homeViewModel.setRef(ref);
  }

  @override
  Widget build(BuildContext context) {
    print('MyHomePage rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref.watch(titleProvider),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ref.watch(messageProvider),
            ),
            Text(
              _homeViewModel.count,
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                    // ref.watch -> ref.read にすると、button の rebuild がされなくなる
                    onPressed: _homeViewModel.onIncrease,
                    tooltip: 'Increment',
                    child: const Icon(CupertinoIcons.plus)),
                FloatingActionButton(
                    // ref.watch -> ref.read にすると、button の rebuild がされなくなる
                    onPressed: _homeViewModel.onDecrease,
                    tooltip: 'Decrement',
                    child: const Icon(CupertinoIcons.minus))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_homeViewModel.countUp),
                Text(_homeViewModel.countDown),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _homeViewModel.onReset,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
