import 'package:dartz/dartz.dart';
import 'package:untitled/core/errors/failure.dart';
import 'package:untitled/core/use_case/no_param_use_case.dart';
import 'package:untitled/features/home/domain_layer/entities/book_entity.dart';

import '../repos/home_repo.dart';

class FetchNewestBooks extends UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchNewestBooks(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call() {
    return homeRepo.fetchNewestBooks();
  }
}
