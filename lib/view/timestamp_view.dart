import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/timestamp_data/timestamp_data.dart';
import 'package:riverpod_countup/view_model/timestamp_view_model.dart';

class TimestampView extends ConsumerStatefulWidget {
  const TimestampView({Key? key}) : super(key: key);

  @override
  ConsumerState<TimestampView> createState() => _TimestampViewState();
}

class _TimestampViewState extends ConsumerState<TimestampView> {
  final TimestampViewModel _timestampViewModel = TimestampViewModel();

  @override
  void initState() {
    super.initState();

    _timestampViewModel.setRef(ref);
  }

  @override
  Widget build(BuildContext context) {
    print('TimestampView rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timestamp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headline4,
            ),
            Consumer(builder: (context, ref, child) {
              return _timestampViewModel.timestampData.when(
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) => Text('Error: $error'),
                  data: (data) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          TimestampData timestampData = data[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text('${timestampData.dateTime}'),
                              trailing: Text('${timestampData.count}'),
                              tileColor: Colors.lightBlueAccent,
                            ),
                          );
                        });
                  });
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _timestampViewModel.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
