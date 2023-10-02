import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies_tech_test/domain/entities/entities.dart';
import 'package:movies_tech_test/infrastructure/repositories_impl/book_repository_impl.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.booksRepository}) : super(HomeInitialState()) {
    on<GetBooksEvent>(_onGetBooksEvent);
  }

  BookRepositoryImpl booksRepository;

  FutureOr<void> _onGetBooksEvent(event, emit) async {
    emit(FetchingBooksState());
    final bookList = await booksRepository.getBooks();
    bookList.fold((l) {
      emit(ErrorFetchingBooksState());
    }, (r) {
      emit(BooksFetchedState(bookList: r));
    });
  }
}
