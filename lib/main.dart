import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled/features/home/data/repos/home_repo_impl.dart';
import 'package:untitled/features/home/domain/use_cases/fetch_newest_books_use_case.dart';

import 'consts.dart';
import 'core/utils/app_router.dart';
import 'core/utils/setup_service_locator.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'features/home/domain/entities/book_entity.dart';
import 'features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'features/home/presentation/manager/newest_books/newest_books_cubit.dart';

void main() async {
  setup();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);

  Bloc.observer = SimpleBlocObserver();

  runApp(BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()),
            )..fetchFeaturedBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()),
            )..fetchNewestBooks();
          },
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.majorMonoDisplayTextTheme(
                ThemeData.dark().textTheme)),
      ),
    );
  }
}
