import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies_tech_test/domain/entities/entities.dart';
import 'package:movies_tech_test/infrastructure/repositories_impl/book_repository_impl.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  BookRepositoryImpl booksRepository;

  HomeBloc({required this.booksRepository}) : super(HomeInitialState()) {
    on<GetBooksEvent>(_onGetBooksEvent);
    on<SearchBooksEvent>(_onSearchBooksEvent);
  }

  FutureOr<void> _onGetBooksEvent(event, emit) async {
    emit(FetchingBooksState());
    final bookList = await booksRepository.getBooks();
    bookList.fold((l) {
      emit(ErrorFetchingBooksState());
    }, (r) {
      emit(BooksFetchedState(bookList: r));
    });
  }

  FutureOr<void> _onSearchBooksEvent(event, emit) async {
    emit(SearchingBooksState());

    // Filter the books based on the search query
    final filteredBooks = event.bookList.where((book) {
      final title = book.title.toLowerCase();
      final authors =
          book.authors.map((author) => author.toLowerCase()).join(' ');
      return title.contains(event.query.toLowerCase()) ||
          authors.contains(event.query.toLowerCase());
    }).toList();

    emit(SearchResultsState(
      bookList: event.bookList,
      results: filteredBooks,
    ));
  }
}
