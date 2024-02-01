import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static String homeViewPath = '/homeView';
  static String bookDetailsViewPath = '/BookDetailsViewPath';
  static String searchViewPath = '/SearchView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: homeViewPath,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      //
      // GoRoute(
      //   path: BookDetailsViewPath,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return BlocProvider(
      //         create: (BuildContext context) =>  SimillarBookCubit(
      //             getIt.get<HomeRepoImpl>()
      //         ),
      //         child:  BookDetailsView(bookModel: state.extra as BookModel,
      //         ));
      //   },
      // ),
      //
      // GoRoute(
      //   path: SearcgViewPath,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const SerchView();
      //   },
      // ),
    ],
  );
}
