import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../manager/featured_books/featured_books_cubit.dart';
import 'custom_book_item.dart';

class FeaturedListview extends StatefulWidget {
  const FeaturedListview({Key? key, required this.books}) : super(key: key);

  final List<BookEntity> books;

  @override
  _FeaturedListviewState createState() => _FeaturedListviewState();
}

class _FeaturedListviewState extends State<FeaturedListview> {
  // Define a ScrollController
  final ScrollController _scrollController = ScrollController();
  var isLoading = false;
  var pageNumber = 1;
  @override
  void initState() {
    super.initState();
    // Add a listener to the ScrollController
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // Dispose the ScrollController when not needed
    _scrollController.dispose();
    super.dispose();
  }

  // Scroll listener function
  void _scrollListener() {
    // Calculate the position of the last item in the list
    double position = _scrollController.position.pixels;
    double maxScroll = _scrollController.position.maxScrollExtent;
    double threshold = maxScroll * 0.7;

    // Check if the scroll position reaches the threshold
    if (position >= threshold) {
      if (!isLoading) {
        isLoading = true;
        // Call your fetchFeaturedBooksRequest function
        BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: pageNumber++); //context
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.books.length);
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller:
            _scrollController, // Assign the ScrollController to the ListView
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookItem(
              image: widget.books[index].image ??
                  'http://books.google.com/books/content?id=vZvIzaQbMYwC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
            ),
          );
        },
      ),
    );
  }
}
