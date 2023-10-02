part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

// class InitialEvent extends HomeEvent {
//   const InitialEvent();

//   @override
//   List<Object> get props => [];
// }

class GetBooksEvent extends HomeEvent {
  const GetBooksEvent();

  @override
  List<Object> get props => [];
}

class SearchBooks extends HomeEvent {
  const SearchBooks({required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}
