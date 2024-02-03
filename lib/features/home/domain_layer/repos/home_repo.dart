import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<List<BookEntity>> fetchBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}
