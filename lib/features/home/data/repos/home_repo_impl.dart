import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled/core/errors/failure.dart';
import 'package:untitled/features/home/data/data_source/home_local_data_source.dart';
import 'package:untitled/features/home/data/data_source/home_remote_data_source.dart';
import 'package:untitled/features/home/domain_layer/entities/book_entity.dart';
import 'package:untitled/features/home/domain_layer/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(this.homeRemoteDataSource, this.homeLocalDataSource);

  @override
  Future<Either<Failure, List<BookEntity>>> fetchBooks() async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDataSource.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      booksList = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.diorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDataSource.fetchNewestBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      booksList = await homeRemoteDataSource.fetchNewestBooks();
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.diorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
