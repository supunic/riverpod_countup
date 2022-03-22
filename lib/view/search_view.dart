import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/view_model/search_view_model.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  final SearchViewModel _searchViewModel = SearchViewModel();

  @override
  void initState() {
    super.initState();

    _searchViewModel.setRef(ref);
  }

  @override
  Widget build(BuildContext context) {
    print('SearchView rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (text) => _searchViewModel.onChange(text),
              ),
              const Text('without family'),
              Expanded(
                child: _searchViewModel.postalCodeFuture.when(
                  data: (data) => ListView.separated(
                    itemCount: data.data.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.data[index].en.prefecture),
                          Text(data.data[index].en.address1),
                          Text(data.data[index].en.address2),
                          Text(data.data[index].en.address3),
                          Text(data.data[index].en.address4),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.black,
                    ),
                  ),
                  error: (error, stack) => Text(error.toString()),
                  loading: () => const AspectRatio(
                    aspectRatio: 1,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              const Text('with family'),
              Expanded(
                child: _searchViewModel.postalCodeFutureFamily.when(
                  data: (data) => ListView.separated(
                    itemCount: data.data.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.data[index].en.prefecture),
                          Text(data.data[index].en.address1),
                          Text(data.data[index].en.address2),
                          Text(data.data[index].en.address3),
                          Text(data.data[index].en.address4),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.black,
                    ),
                  ),
                  error: (error, stack) => Text(error.toString()),
                  loading: () => const AspectRatio(
                    aspectRatio: 1,
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
