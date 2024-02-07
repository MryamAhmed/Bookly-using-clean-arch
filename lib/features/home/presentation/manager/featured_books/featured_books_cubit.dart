import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_featured_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await fetchFeaturedBooksUseCase.call();

    result.fold((l) => {emit(FeaturedBooksFailure(l.message))},
        (r) => {emit(FeaturedBooksSuccess(r))});
  }
}
