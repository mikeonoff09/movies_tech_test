part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetBooksEvent extends HomeEvent {
  const GetBooksEvent();

  @override
  List<Object> get props => [];
}

class SearchBooksEvent extends HomeEvent {
  const SearchBooksEvent({
    required this.query,
    required this.bookList,
  });

  final String query;
  final List<BookEntity> bookList;

  @override
  List<Object> get props => [query, bookList];
}
