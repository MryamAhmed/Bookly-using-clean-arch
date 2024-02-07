import 'package:flutter/material.dart';
import 'package:untitled/core/extention/spacing.dart';

import '../../../../../core/utils/styles.dart';
import 'book_action.dart';
import 'book_ratting.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .27),
          child: const CustomBookItem(),
        ),
        Text(
          'The Jungle Book',
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        6.vertical,
        Opacity(
          opacity: .7,
          child: Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        18.vertical,
        const BookRatting(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const BooksAction(),
        8.vertical,
      ],
    );
  }
}
