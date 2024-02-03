import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<type> {
  Future<Either<Failure, type>> call();
}
