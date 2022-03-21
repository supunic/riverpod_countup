import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/data/count_data.dart';
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

// ConsumerStatefulWidget ... ConsumerState で ref がグローバルに使用可能
//                            state 変更時に rebuild は走ってしまうが、可読性がいい
class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
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
              ref.watch(countDataProvider).count.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                    // ref.watch -> ref.read にすると、button の rebuild がされなくなる
                    onPressed: () {
                      CountData countData = ref.read(countDataProvider);
                      ref
                          .read(countDataProvider.state)
                          .update((state) => countData.copyWith(
                                count: state.count + 1,
                                countUp: state.countUp + 1,
                              ));
                    },
                    tooltip: 'Increment',
                    child: const Icon(CupertinoIcons.plus)),
                FloatingActionButton(
                    // ref.watch -> ref.read にすると、button の rebuild がされなくなる
                    onPressed: () {
                      CountData countData = ref.read(countDataProvider);
                      ref
                          .read(countDataProvider.state)
                          .update((state) => countData.copyWith(
                                count: state.count - 1,
                                countDown: state.countDown + 1,
                              ));
                    },
                    tooltip: 'Decrement',
                    child: const Icon(CupertinoIcons.minus))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // countDataProvider.select() で
                // freezed オブジェクト内で特定のプロパティにアクセスを制限する
                // -> そのプロパティに更新が入った時のみ rebuild されるようになる
                Text(
                  ref
                      .watch(countDataProvider.select((value) => value.countUp))
                      .toString(),
                ),
                Text(ref
                    .watch(countDataProvider.select((value) => value.countDown))
                    .toString()),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(countDataProvider.state).update((state) => const CountData(
                  count: 0,
                  countUp: 0,
                  countDown: 0,
                ));
          },
          tooltip: 'Refresh',
          child: const Icon(Icons.refresh)),
    );
  }
}
