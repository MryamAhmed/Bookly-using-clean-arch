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
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }

    var result = await fetchFeaturedBooksUseCase.call(pageNumber);

    result.fold((l) {
      if (pageNumber == 0) {
        emit(FeaturedBooksFailure(l.message));
      } else {
        emit(FeaturedBooksPaginationFailure(l.message));
      }
    }, (r) => {emit(FeaturedBooksSuccess(r))});
  }
}
