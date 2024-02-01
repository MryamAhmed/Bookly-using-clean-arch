import 'package:flutter/material.dart';

import 'custome_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [CustomeAppBar()],
      ),
    );
  }
}
