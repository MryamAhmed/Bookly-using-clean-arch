import 'package:untitled/consts.dart';

import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/function/save_data_to_box.dart';
import '../../domain/entities/book_entity.dart';
import '../models/BookModel.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming');
    List<BookEntity> books = parse(data);

    saveDataToLocal(books, kFeaturedBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> books = parse(data);

    saveDataToLocal(books, kNewestBox);

    return books;
  }
}

List<BookEntity> parse(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var bookMap in data['result']) {
    books.add(BookModel.fromJson(bookMap));
  }
  return books;
}
