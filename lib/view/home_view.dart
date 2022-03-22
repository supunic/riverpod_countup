import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/provider/view/home_provider.dart';
import 'package:riverpod_countup/view/search_view.dart';
import 'package:riverpod_countup/view_model/home_view_model.dart';

// ConsumerStatefulWidget
// -> ConsumerState で ref がグローバルに使用可能
// -> state 変更時に rebuild は走ってしまうが、可読性がいい
class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();

    _homeViewModel.setRef(ref);
    _homeViewModel.initSound();
  }

  @override
  Widget build(BuildContext context) {
    print('HomeView rebuild');
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
            const Padding(padding: EdgeInsets.only(bottom: 80.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                    onPressed: _homeViewModel.onIncrease,
                    heroTag: 'Increment',
                    tooltip: 'Increment',
                    child: const Icon(CupertinoIcons.plus)),
                FloatingActionButton(
                    onPressed: _homeViewModel.onReset,
                    heroTag: 'Refresh',
                    tooltip: 'Refresh',
                    child: const Icon(Icons.refresh)),
                FloatingActionButton(
                    onPressed: _homeViewModel.onDecrease,
                    heroTag: 'Decrement',
                    tooltip: 'Decrement',
                    child: const Icon(CupertinoIcons.minus)),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 8.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_homeViewModel.countUp),
                const Text(' '),
                Text(_homeViewModel.countDown),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SearchView()));
        },
        heroTag: 'Search',
        tooltip: 'Search',
        backgroundColor: Colors.grey,
        child: const Icon(Icons.search),
      ),
    );
  }
}
