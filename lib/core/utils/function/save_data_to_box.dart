import 'package:hive/hive.dart';

import '../../../features/home/domain/entities/book_entity.dart';

void saveDataToLocal(List<BookEntity> books, String boxName) {
  var box = Hive.box(boxName);
  box.add(books);
}
