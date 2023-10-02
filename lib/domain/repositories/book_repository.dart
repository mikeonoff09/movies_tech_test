import 'package:dartz/dartz.dart';
import 'package:movies_tech_test/domain/entities/book_entity.dart';

abstract class BookRepository {
  Future<Either<Fail, List<BookEntity>>> getBooks();
  Future<Either<Fail, List<BookEntity>>> searchBooks(String query);
}
