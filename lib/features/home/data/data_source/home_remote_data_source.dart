import 'package:untitled/consts.dart';

import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/function/save_data_to_box.dart';
import '../../domain/entities/book_entity.dart';
import '../models/BookModel.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks(); //{int pageNumber = 0}

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    //{int pageNumber = 0}
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=programming'); //&startIndex=${pageNumber * 10}

    print('data12 $data');

    List<BookEntity> books = parse(data);

    print('dataaaaa $data');
    print('data after parsing from repo $books');

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
  print('make sure ${data['items']}');

  if (data['items'] != null) {
    final List itemsList = data['items'];
    print("data is => ${BookModel.fromJson((data['items'] as List)[2])}");
    // for (int i = 0; i < itemsList.length; i++) {
    //   //i in data['']
    //   print('index = $i');
    //   // print('data dont null fromm loop ${data['items']} ');
    //   books.add(BookModel.fromJson(itemsList[i]));
    //   print('inside loop');
    // }

    print('data dont null after parsing ');
  }
  print('data dont null befor return parsing  $books');
  return books;
}
