import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchBooks();

  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
