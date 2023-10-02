part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  final List<BookEntity> bookList;

  const HomeState({required this.bookList});
}

final class HomeInitialState extends HomeState {
  HomeInitialState() : super(bookList: []);
}

final class FetchingBooksState extends HomeState {
  FetchingBooksState() : super(bookList: []);
}

final class SearchingBooksState extends HomeState {
  SearchingBooksState() : super(bookList: []);
}

final class ErrorFetchingBooksState extends HomeState {
  ErrorFetchingBooksState() : super(bookList: []);
}

final class ErrorSearchingBooksState extends HomeState {
  ErrorSearchingBooksState() : super(bookList: []);
}

final class BooksFetchedState extends HomeState {
  const BooksFetchedState({required super.bookList});
}

final class SearchResultsState extends HomeState {
  const SearchResultsState({required super.bookList});
}
