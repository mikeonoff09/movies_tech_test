import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:movies_tech_test/presentation/bloc/home_bloc.dart';
import 'package:movies_tech_test/presentation/widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<HomeBloc>()..add(const GetBooksEvent()),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Books'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (query) {
                      if (query.isNotEmpty) {
                        context.read<HomeBloc>().add(SearchBooksEvent(
                              query: query,
                              bookList: state.bookList,
                            ));
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      hintText: 'Search for books',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: state is SearchResultsState
                      ? state.results.isNotEmpty
                          ? GridBuilder(bookList: state.results)
                          : const Center(child: Text("No results"))
                      : GridBuilder(bookList: state.bookList),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
