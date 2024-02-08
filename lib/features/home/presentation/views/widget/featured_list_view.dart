import 'package:flutter/material.dart';

import '../../../domain/entities/book_entity.dart';
import 'custom_book_item.dart';

class FeaturedListview extends StatelessWidget {
  const FeaturedListview({Key? key, required this.books}) : super(key: key);

  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookItem(
              image: books[index].image ?? '',
            ),
          );
        },
      ),
    );
  }
}
