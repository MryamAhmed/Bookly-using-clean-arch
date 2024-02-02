import 'package:flutter/material.dart';
import 'package:untitled/core/extention/spacing.dart';

import '../../../../core/utils/styles.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const CustomAppBar(),
          const FeaturedListview(),
          50.vertical,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Best Seller',
              style: Styles.textStyle18,
            ),
          ),
        ],
      ),
    );
  }
}
