import 'package:dartz/dartz.dart';
import 'package:movies_tech_test/core/app_dio.dart';
import 'package:movies_tech_test/domain/entities/book_entity.dart';
import 'package:movies_tech_test/domain/repositories/book_repository.dart';
import 'package:movies_tech_test/infrastructure/models/book_model.dart';

class BookRepositoryImpl implements BookRepository {
  BookRepositoryImpl({required AppDio appDio}) : _appDio = appDio;

  final AppDio _appDio;

  @override
  Future<Either<Fail, List<BookEntity>>> getBooks() async {
    const endpoint = "/books";
    try {
      final response = await _appDio.instance.get(endpoint);
      final bookList = List.from(response.data["books"]).map((e) {
        return BookModel.fromJson(e);
      }).toList();
      return Right(bookList);
    } catch (e) {
      return Left(Fail("Failed to get books"));
    }
  }

  @override
  Future<Either<Fail, List<BookEntity>>> searchBooks(String query) async {
    const endpoint = "/search";
    try {
      // Not getting a valid response
      final response = await _appDio.instance.post(endpoint);
      final bookList = List.from(response.data["books"]).map((e) {
        return BookModel.fromJson(e);
      }).toList();
      return Right(bookList);
    } catch (e) {
      return Left(Fail("Failed to get books"));
    }
  }
}
