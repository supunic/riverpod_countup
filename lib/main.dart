import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/provider.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyHomePage rebuild');
    return Scaffold(
      appBar: AppBar(
        // Consumer を使うことで、変更箇所のみ更新が入り、
        // MyHomePage が毎回毎回 rebuild されなくなる
        title: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) => Text(
            ref.watch(titleProvider),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(
              builder: (context, ref, child) => Text(
                ref.watch(messageProvider),
              ),
            ),
            Consumer(
              builder: (context, ref, child) => Text(
                ref.watch(countProvider).toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          print('button rebuild');
          return FloatingActionButton(
            // ref.watch -> ref.read にすると、button の rebuild がされなくなる
            onPressed: () =>
                ref.read(countProvider.state).update((state) => state + 1),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
