import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_featured_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    emit(FeaturedBooksLoading());

    var result = await fetchFeaturedBooksUseCase.call(pageNumber);

    result.fold(
        (l) => {print(l.message), emit(FeaturedBooksFailure(l.message))},
        (r) => {
              print('data from cubit ${r}'),
              print('length from cubit ${r.length}'),
              emit(FeaturedBooksSuccess(r))
            });
  }
}
