import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class FeaturedListview extends StatelessWidget {
  const FeaturedListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        itemCount: 9,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookItem(),
          );
        },
      ),
    );
  }
}
