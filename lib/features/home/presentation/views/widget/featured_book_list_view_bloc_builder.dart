import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../manager/featured_books/featured_books_cubit.dart';
import 'featured_list_view.dart';
import 'fetured_books_list_view_loading_indicator.dart';

class FeaturedListViewBlocBuilder extends StatefulWidget {
  const FeaturedListViewBlocBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<FeaturedListViewBlocBuilder> createState() =>
      _FeaturedListViewBlocBuilderState();
}

class _FeaturedListViewBlocBuilderState
    extends State<FeaturedListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (BuildContext context, FeaturedBooksState state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedListview(
            books: books,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        }
        return const Center(child: FeaturedBooksListViewLoadingIndicator());
      },
    );
  }
}

SnackBar buildErrorWidget(String errMessage) {
  return SnackBar(
    content: Text(
      errMessage,
      style: const TextStyle(),
    ),
    duration: const Duration(seconds: 3),
  );
}
