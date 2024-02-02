import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'consts.dart';
import 'core/utils/app_router.dart';

void main() {
  runApp(BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.majorMonoDisplayTextTheme(
              ThemeData.dark().textTheme)),
    );
  }
}
