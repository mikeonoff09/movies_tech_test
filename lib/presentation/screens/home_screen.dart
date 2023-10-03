import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_tech_test/presentation/bloc/home_bloc.dart';
import 'package:movies_tech_test/presentation/screens/listeners/home_bloc_listener.dart';
import 'package:movies_tech_test/presentation/widgets/shared/custom_app_bar.dart';
import 'package:movies_tech_test/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<HomeBloc>()..add(const GetBooksEvent()),
      child: const BlocListener<HomeBloc, HomeState>(
        listener: homeBlocListener,
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(),
              CardSwiperBuilder(),
              _Title(),
              BooksCatalogBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final titleLargeStyle = Theme.of(context).textTheme.titleLarge;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text("Catalog", style: titleLargeStyle),
    );
  }
}

class BooksCatalogBuilder extends StatelessWidget {
  const BooksCatalogBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is SearchingBooksState || state is HomeInitialState) {
          return const GridBuilder(bookList: []);
        } else if (state is ErrorFetchingBooksState) {
          return const Center(
            child: Text("Error Fetching Books"),
          );
        } else if (state is ErrorSearchingBooksState) {
          return const Center(
            child: Text("Error Searching Books"),
          );
        } else {
          return GridBuilder(bookList: state.bookList);
        }
      },
    );
  }
}

class CardSwiperBuilder extends StatelessWidget {
  const CardSwiperBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is SearchingBooksState || state is HomeInitialState) {
            return const GridBuilder(bookList: []);
          } else if (state is ErrorFetchingBooksState) {
            return const Center(
              child: Text("Error Fetching Books"),
            );
          } else if (state is ErrorSearchingBooksState) {
            return const Center(
              child: Text("Error Searching Books"),
            );
          } else {
            return CardSwiper(books: state.bookList);
          }
        },
      ),
    );
  }
}
