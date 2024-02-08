import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/featured_books/featured_books_cubit.dart';
import 'featured_list_view.dart';

class FeaturedListViewBlocBuilder extends StatelessWidget {
  const FeaturedListViewBlocBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return FeaturedListview(
            books: state.books,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
